import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Button',
      theme: ThemeData(primaryColor: Colors.white),
      home: ButtonPractice(),
    );
  }
}

// TODO: Practice implementing button
class ButtonPractice extends StatefulWidget {
  @override
  ButtonPracticeState createState() => ButtonPracticeState();
}

class ButtonPracticeState extends State<ButtonPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // step 1: set Column
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // step 2: set ElevatedButton
            
            // step 3: set TextButton
            
            // step 4: set IconButton
            
          ],
        ),
      ),
    );
  }
}
