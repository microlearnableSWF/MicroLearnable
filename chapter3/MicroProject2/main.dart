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
          // We are going to add a DatePicker that can return a date from calender.
          // Let's implement the code in microProject2 section.
          microProject2(),
        ],
      ),
    );
  }
  
  // MicroProject #2: Get Date from a Calender
  
  // This is a variable to store a selected date
  // The inital value is today's date
  DateTime currentDate = DateTime.now();

  Widget microProject2() {
    return Container(); // Replace this widget with Row widget
    // TODO: Set Row with children of Text and OutlinedButton widgets
      // TODO: In Row, make space between Text and OutlindedButton using Expanded widget
      
      // OutlinedButton
        // TODO: Make OutlinedButton with child widget of Text
        // TODO: Set child of Text with currentDate variable
        // TODO: If you pressed the button, call selectedDate() function

        // ** If you want to make a customized button on your own, ignore the following description
        // Set style, onPressed, child option in OutlinedButton
        // TODO: In style, set OutlinedButton.styleFrom() and set primary as Colors.white
        // TODO: In child, set Text, SizedBox(width: ) and Icon in a Row widget
        // TODO: In Text, set currentDate.year.toString(), month and day to show pickedDate and set TextStyle
        // TODO: Use Icons.calendar_today for Icon widget
  }

  Future<void> selectedDate() async {
    // TODO: Declare DateTime? type variable named pickedDate and get DateTime using showDatePicker()
      // showDatePicker
      // TODO: Set initialDate with currentDate
      // TODO: Set context: context
      // TODO: Set firstDate, lastDate as you want with DateTime()
    // TODO: In setState(), change currentDate to pickedDate if pickedDate is not null and not currentDate
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