import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlertDialog',
      theme: ThemeData(primaryColor: Colors.white),
      home: AlertDialogPractice(),
    );
  }
}

class AlertDialogPractice extends StatefulWidget {
  @override
  _AlertDialogPracticeState createState() => _AlertDialogPracticeState();
}

class _AlertDialogPracticeState extends State<AlertDialogPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          // step 1: make an ElevatedButton named 'Show AlertDialog'
          
              // step 2: call showDialog when pressed
          
                // step 3: set context and builder
          
                  // step 4: in builder function, return AlertDialog with properties of title, content and actions

     ));
  }
}
