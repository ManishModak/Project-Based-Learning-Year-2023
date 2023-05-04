import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form

  late String userName;
  late String passWord;

  //Routing Section to loading
  void nextPage() {
    Navigator.pushReplacementNamed(context, "/loading"); // Navigate to the loading page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Form(
              key: _formKey, // Assign the form key
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const SizedBox(height: 10,),
                const Text(
                  'MAT SECURITY',
                  style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(fontSize: 20,letterSpacing: 1.25,color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userName = value!; // Save the entered username
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                  ),
                  decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 20,letterSpacing: 1.25,color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passWord = value!; // Save the entered password
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            // Perform login with email and password
                          }
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          nextPage(); // Navigate to the loading page
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            // Perform login with email and password
                          }
                        },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      )
    );
  }
}