import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mat_security/pages/home_page.dart';
import 'package:mat_security/pages/login_page.dart';
import 'package:mat_security/pages/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /*
 FirebaseFirestore _fire = FirebaseFirestore.instance;
  
  Map<String, dynamic> std_data = {
    "id": "1102",
    "name": "Tanny",
    "roomNo": "210",
    "branch": "IT",
    "mobileNo":9645764765
  };
  
  await _fire.collection("users").add(std_data);

  QuerySnapshot shot = await _fire.collection("users").get();
  for(var doc in shot.docs){
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    log(data['name']);
  }

  QuerySnapshot snapshot =
  await _fire.collection("users").get();
  if (kDebugMode) {
    print("Number of documents: ${snapshot.docs.length}");
  }

  DocumentSnapshot snapshot1 = await _fire.collection("users").doc("pUgp2dqmuCu6zU04djkx").get();

  Map<String, dynamic> data = snapshot1.data() as Map<String, dynamic>;
  String name = data['name'];
  log(name);

  QuerySnapshot snapshot3 = await _fire.collection("users").get();
  for (var doc in snapshot3.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if(data['branch']=="IT"){
      log("message");
      log(doc.id);
    }
    String id = data['id'];
    String name = data['name'];
    String room = data['roomNo'];
    String branch = data['branch'];
    int mobile = data['mobileNo'];
    if (kDebugMode) {
      print("Id:        $id\n"
          "Name:      $name\n"
          "Room No:   $room\n"
          "Branch:    $branch\n"
          "Mobile No: $mobile");
    }
  }*/



  runApp(MaterialApp(
    initialRoute: '/menu', // Set the initial route to '/login'
    routes: {
      // Route for the loading page
      '/home': (context) => const Home(), // Route for the home page
      '/login': (context) => const Login(), // Route for the login page
      '/menu': (context) => const Menu(), // Route for the menu page
    },
  ));
}
