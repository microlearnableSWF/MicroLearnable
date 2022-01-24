import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scaffold',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaffoldPractice(),
    );
  }
}

// TODO: Practice Scaffold Widget
class ScaffoldPractice extends StatelessWidget {
  // step 1: set Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // step 2: set AppBar

      // step 3: set body with yellow container box

    );
  }
}
