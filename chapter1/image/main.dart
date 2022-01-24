import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePractice(),
    );
  }
}

// TODO: Practice NetworkImage Widget
class ImagePractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // step 1: set Container

        // step 2: set height and width

        // step 3: set Image.network using BoxDecoration

          // step 4: set BoxShape.circle

      ),
    ));
  }
}
