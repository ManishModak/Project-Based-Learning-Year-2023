import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String docName;

  DatabaseService({required this.docName});
  //Collection Reference
  final CollectionReference mainCollection = FirebaseFirestore.instance.collection('studentData');

  Future addStudent(String id, String name, String roomNo, Long mobileNo, String branch) async {
    return await mainCollection.add({
      "id":id,
      "name":name,
      "roomNo":roomNo,
      "mobileNo":mobileNo,
      "branch":branch
    });
  }

  /*
    String id ;
  String name ;
  String roomNo ;
  Long mobileNo ;
  String branch ;
   */

  Stream<QuerySnapshot> get studentData{
    return mainCollection.snapshots();
  }
}