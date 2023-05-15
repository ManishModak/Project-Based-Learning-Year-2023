import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mat_security/pages/home_page.dart';
import 'package:mat_security/pages/login_page.dart';
import 'package:mat_security/pages/menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
