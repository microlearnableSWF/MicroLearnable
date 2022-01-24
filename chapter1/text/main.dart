import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text',
      theme: ThemeData(),
      home: TextPractice(),
    );
  }
}

//TODO: Practice Text Widget
class TextPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // step 1: set Text widget with string

          // step 2: set TextStyle

        ),
      ),
    );
  }
}
