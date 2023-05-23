import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mat_security/services/main_database.dart';

import '../common/constants.dart';

class CircularProgress extends StatelessWidget {
  final double percentage;

  const CircularProgress({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: CircularProgressIndicator(
        value: percentage,
        backgroundColor: Colors.black45,
        strokeWidth: 14,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }
}


class NewStudent extends StatefulWidget {
  const NewStudent({Key? key}) : super(key: key);

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {

  String id = '';
  String name = '';
  String roomNo = '';
  String branch = '';
  String mobileNo = '';

  File? studentPic;
  double percentage=0;
@override
void dispose() {
  super.dispose();
}

void _submitForm() async {

  MainDatabase student = MainDatabase();

  UploadTask uploadTask = FirebaseStorage.instance.ref().child("pictures").child(id).child(id).putFile(studentPic!);

  uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
    setState(() {
      percentage = (snapshot.bytesTransferred/snapshot.totalBytes);
    });
  });
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadUrl =  await taskSnapshot.ref.getDownloadURL();

  student.addStudent(id: id, name: name, room: roomNo, branch: branch, mobile: mobileNo, url: downloadUrl);
  setState(() {
    percentage = 0;
  });
}

@override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: const Text("New Hostelite"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () async {
                        percentage = 0;
                        XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);

                        if(selectedImage != null){
                          File convertedImage = File(selectedImage.path);
                          setState(() {
                            studentPic = convertedImage;
                          });
                        }
                        else{
                          if (kDebugMode) {
                            print("Image not selected");
                          }
                        }
                      },
                      child: CircleAvatar(
                        backgroundImage: (studentPic != null) ? FileImage(studentPic!) : null,
                        radius: 80,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    CircularProgress(percentage: percentage)
                  ]
                ),
              ),
              const Divider(
                height: 40.0,
              ),
              TextFormField(
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
                decoration: textInputDecoration.copyWith(hintText: "ID"),
                validator: (val) => val == null || val.isEmpty ? "Enter ID" : null,
                onChanged: (val) {
                  setState(() => id = val.toUpperCase().trim());
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
                decoration: textInputDecoration.copyWith(hintText: "Name"),
                validator: (val) => val == null || val.isEmpty ? "Enter Name" : null,
                onChanged: (val) {
                  String capName = val[0].toUpperCase() + val.substring(1) ;
                  setState(() => name = capName.trim());
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
                decoration: textInputDecoration.copyWith(hintText: "Room No"),
                validator: (val) => val == null || val.isEmpty ? "Enter Room No" : null,
                onChanged: (val) {
                  setState(() => roomNo = val.toUpperCase().trim());
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
                decoration: textInputDecoration.copyWith(hintText: "Branch"),
                validator: (val) => val == null || val.isEmpty ? "Enter Branch" : null,
                onChanged: (val) {
                  setState(() => branch = val.toUpperCase().trim());
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
                decoration: textInputDecoration.copyWith(hintText: "Mobile No"),
                validator: (val) => val == null || val.isEmpty ? "Enter Mobile No" : null,
                onChanged: (val) {
                  setState(() => mobileNo = val.toUpperCase().trim());
                },
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: _submitForm ,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
