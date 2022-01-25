import 'package:flutter/material.dart';

// This is for storing types of Gender
enum Gender { man, woman }

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
          microProject2(),
          // Here we are going to add Radio buttons to pick either Male for Female.
          // Let's implement the code in microProject3 section.
          microProject3(),
        ],
      ),
    );
  }
  
  // MicroProject #3: Choose Gender with Radio Button
  Gender _gender = Gender.man;

  Widget microProject3() {
    return Container(); // Replace this widget with Column widget
    // TODO: Set Column with children of Text and Row widgets
      // TODO: In Row, set Text and Radio for each Male and Female
      // TODO: Make Radio type Gender using Gender type variable '_gender'
  }
  
  DateTime currentDate = DateTime.now();

  Widget microProject2() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Birth',
            style: TextStyle(fontSize: 20),
          ),
          const Expanded(child: SizedBox()),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                selectedDate();
              },
              child: Row(
                children: [
                  Text(
                    currentDate.year.toString() +
                        '/' +
                        currentDate.month.toString() +
                        '/' +
                        currentDate.day.toString(),
                    style: const TextStyle(color: Colors.black26),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.calendar_today, color: Colors.black26)
                ],
              ))
        ],
      ),
    );
  }

  Future<void> selectedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));

    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
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