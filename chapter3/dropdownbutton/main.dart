import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DropdownButton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DropdownButtonPractice(),
    );
  }
}

// TODO: Practice using dropdownbutton.
class DropdownButtonPractice extends StatefulWidget {
  @override
  _DropdownButtonPracticeState createState() => _DropdownButtonPracticeState();
}

class _DropdownButtonPracticeState extends State<DropdownButtonPractice> {
  // step 1: set dropDownList and dropDownListValue

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // step 2: set type for DropdownButton & set value, items and onchanged
      child: 
    ));
  }
}
