import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Container',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContainerPractice(),
    );
  }
}

// TODO: Making a Container
class ContainerPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Step 1: Set child

        //Step 2: Set color

        //Step 3: Set the size of height and width


        //Step 4: Set the size of margin

        //Step 5: Set the size of padding

      ),
    );
  }
}
