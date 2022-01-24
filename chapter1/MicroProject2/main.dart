import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Resume(),
    );
  }
}

class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Resume',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          // you can change padding as much as you want
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [practice2()],
          ),
        ));
  }

  /*
     Use Center, Container, Image widgets.
       - Image should be in the middle. You can use Center widget.
       - Use the shape of BoxDecoration which is in Container to make the image round.
  */
  Widget practice2() {
    return Center(
      child: Container(),
    );
  }
}