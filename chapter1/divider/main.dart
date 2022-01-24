import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Divider',
      theme: ThemeData(),
      home: DividerPractice(),
    );
  }
}

//Practice using divider widget.
class DividerPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.lightBlueAccent,
          ),
          // step 1: set Divider
          
          // step 2: set thickness and color

          Container(
            height: 100,
            color: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }
}
