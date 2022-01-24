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
      title: 'Padding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaddingPractice(),
    );
  }
}

// TODO: Practice Padding Widget
class PaddingPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // step 1: set child
        child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow),

        // step 2: set padding as EdgeInsets.all

        // step 3: set padding as EdgeInsets.LTRB

        // step 4: set padding as EdgeInsets.only

        // step 5: set padding as EdgeInsets.symmetric

      ),
    );
  }
}
