import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: IconPractice(),
    );
  }
}

//TODO: Practice using icon widget.
class IconPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
        // step 1: set Icon

            // step 2: set size and color

    ));
  }
}
