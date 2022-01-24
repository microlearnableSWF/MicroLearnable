import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Switch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SwitchPractice(),
    );
  }
}

class SwitchPractice extends StatefulWidget {
  @override
  _SwitchPracticeState createState() => _SwitchPracticeState();
}

class _SwitchPracticeState extends State<SwitchPractice> {
  // step 1: set Boolean type value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // step 2: set Text and Switch in Row class
      // In Switch set value and onChanged option
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          
        ],
      ),
    ));
  }
}