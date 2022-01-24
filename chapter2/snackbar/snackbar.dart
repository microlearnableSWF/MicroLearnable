import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnackBar',
      theme: ThemeData(primaryColor: Colors.white),
      home: SnackBarPractice(),
    );
  }
}

// TODO: Practice using snackbar 
class SnackBarPractice extends StatefulWidget {
  @override
  _SnackBarPracticeState createState() => _SnackBarPracticeState();
}

class _SnackBarPracticeState extends State<SnackBarPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            // step 1: make an ElevatedButton named 'Show SnackBar'
              // step 2: call ScaffoldMessenger.of(context).showSnackBar when pressed
                // step 3: set SnackBar content, duration and action(ScaffoldMessenger.of(context).hideCurrentSnackBar();)
        );
      },
    )));
  }
}