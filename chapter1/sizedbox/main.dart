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
      title: 'SizedBox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SizedBoxPractice(),
    );
  }
}

// TODO: Practice Sizedbox Widget
class SizedBoxPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.lightBlueAccent,
      // step 1: set SizedBox
        // step 2: set height, width
        // step 3: set color with child of Container
    ));
  }
}
