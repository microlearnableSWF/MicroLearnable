import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        leading: const Icon(Icons.keyboard_backspace),
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Here we are going to add TextFormFields to get string input from user.
          // Let's implement the code in microProject1 section.
          microProject1('Name', nameController),
          microProject1('ID', idController),
          microProject1('Password', passwordController),
        ],
      ),
    );
  }

  // MicroProject #1: Get Name, ID, Password from User
  
  // First, declare TextEditingController for each field.
  // We've already done it for you.
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget microProject1(String fieldName, TextEditingController controllerName) {
    return Container(); // Replace this widget with Column widget
    // TODO: Set Text and TextFormField in Column widget
      // TODO: Set crossAxisAlignment in Column
      
      // Text widget
      // TODO: Make use of the fieldName parameter as child of Text
      
      // TextFormField widget
      // TODO: Set controller(controllerName parameter)
      // TODO: Set decoration with hintText(fieldName parameter)
      // TODO: Set obscureText(if fieldName is 'Password')
  }
}