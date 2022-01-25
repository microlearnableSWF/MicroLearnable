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
          microProject1('Name', nameController),
          microProject1('ID', idController),
          microProject1('Password', passwordController),
        ],
      ),
    );
  }
  

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget microProject1(String fieldName, TextEditingController controllerName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
              controller: controllerName,
              decoration: InputDecoration(
                  hintText: fieldName, contentPadding: EdgeInsets.zero),
              obscureText: fieldName == 'Password' ? true : false),
        )
      ],
    );
  }
}