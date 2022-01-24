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
      title: 'Expadend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpandedPractice(),
    );
  }
}

// TODO: Practice Expanded Widget
class ExpandedPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        // step 1: set Row
        child: Row(
          children: [
            // step 2: set children using two container with different color
            // step 3: set first container as expanded
          ],
        ),
      ),
    );
  }
}
