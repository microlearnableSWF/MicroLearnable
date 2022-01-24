import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// step 1: set enum 'Radio List'

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RadioPractice(),
    );
  }
}

// Practice using Radio widget.
class RadioPractice extends StatefulWidget {
  @override
  _RadioPracticeState createState() => _RadioPracticeState();
}

class _RadioPracticeState extends State<RadioPractice> {
  // step 2: set 'RadioList' variable name _currentValue as item1.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // step 3: use Column and Row to indicate radio.
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Radio Button',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              // step 4: set Radio type RadioList.
              
            ],
          )
        ],
      ),
    );
  }
}