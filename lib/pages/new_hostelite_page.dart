import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mat_security/services/main_database.dart';

import '../common/constants.dart';

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
@override
void dispose() {
  super.dispose();
}

void _submitForm() async {

  MainDatabase student = MainDatabase();

  UploadTask uploadTask = FirebaseStorage.instance.ref().child("pictures").child(id).child(id).putFile(studentPic!);
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadUrl =  await taskSnapshot.ref.getDownloadURL();

  student.addStudent(id: id, name: name, room: roomNo, branch: branch, mobile: mobileNo, url: downloadUrl);

}

@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("New Hostelite"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black45,
        child: Column(
          children: [
            Center(
              child: CupertinoButton(
                onPressed: () async {
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
                  radius: 40,
                  backgroundColor: Colors.grey,
                ),
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
            ElevatedButton(
              onPressed: _submitForm ,
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}