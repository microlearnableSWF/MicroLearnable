import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Center',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CenterPractice(),
    );
  }
}

// TODO: Practice Center Widget
class CenterPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          //step 1: Set child
          child: Container(
              width: 70,
              height: 70,
              color: Colors.yellow),

          //step 2: Set Height/Width factor


        ),
      ),
    );
  }
}
