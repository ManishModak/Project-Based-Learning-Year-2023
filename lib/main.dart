import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mat_security/pages/home_page.dart';
import 'package:mat_security/pages/login_page.dart';
import 'package:mat_security/pages/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  QuerySnapshot snapshot =
  await FirebaseFirestore.instance.collection("users").get();
  print("Number of documents: ${snapshot.docs.length}");

  QuerySnapshot snapshot1 = await FirebaseFirestore.instance.collection("users").get();
  snapshot1.docs.forEach((DocumentSnapshot doc) {
    print("Document ID: ${doc.id}");
  });

  QuerySnapshot snapshot3 = await FirebaseFirestore.instance.collection("users").get();
  snapshot3.docs.forEach((DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    int name = data['mobileNo'];
    print("Document Name: $name");
  });



  runApp(MaterialApp(
    initialRoute: '/home', // Set the initial route to '/login'
    routes: {
      // Route for the loading page
      '/home': (context) => const Home(), // Route for the home page
      '/login': (context) => const Login(), // Route for the login page
      '/menu': (context) => const Menu(), // Route for the menu page
    },
  ));
}
