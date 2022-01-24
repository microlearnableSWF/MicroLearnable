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
      title: 'Margin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MarginPractice(),
    );
  }
}

// TODO: Practice Margin Widget
class MarginPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: Container(
          // step 1: set child
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow),

          // step 2: set margin as EdgeInsets.all

          // step 3: set margin as EdgeInsets.LTRB

          // step 4: set margin as EdgeInsets.only

          // step 5: set margin as EdgeInsets.symmetric

        ),
      ),
    );
  }
}
