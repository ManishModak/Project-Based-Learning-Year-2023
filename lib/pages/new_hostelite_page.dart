import 'package:flutter/material.dart';
import 'package:mat_security/services/main_database.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({Key? key}) : super(key: key);

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {



final TextEditingController _idController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _roomNoController = TextEditingController();
final TextEditingController _branchController = TextEditingController();
final TextEditingController _mobileNoController = TextEditingController();

@override
void dispose() {
  _idController.dispose();
  _nameController.dispose();
  _roomNoController.dispose();
  _branchController.dispose();
  _mobileNoController.dispose();
  super.dispose();
}

void _submitForm() {
  String id = _idController.text;
  String name = _nameController.text;
  String roomNo = _roomNoController.text;
  String branch = _branchController.text;
  String mobileNo = _mobileNoController.text;

  MainDatabase student = MainDatabase();
  student.addStudent(id: id, name: name, room: roomNo, branch: branch, mobile: mobileNo);

  // Clear the text fields
  _idController.clear();
  _nameController.clear();
  _roomNoController.clear();
  _branchController.clear();
  _mobileNoController.clear();

  // Display a success message or navigate to another page
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Data Entry'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ID:'),
          TextField(
            controller: _idController,
          ),
          const SizedBox(height: 16.0),
          const Text('Name:'),
          TextField(
            controller: _nameController,
          ),
          const SizedBox(height: 16.0),
          const Text('Room No:'),
          TextField(
            controller: _roomNoController,
          ),
          const SizedBox(height: 16.0),
          const Text('Branch:'),
          TextField(
            controller: _branchController,
          ),
          const SizedBox(height: 16.0),
          const Text('Mobile No:'),
          TextField(
            controller: _mobileNoController,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    ),
  );
}
}