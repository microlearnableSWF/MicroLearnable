import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ListView',
        theme: ThemeData(primaryColor: Colors.white),
        home: ListViewPractice());
  }
}

// TODO - Practice using ListView
class ListViewPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        height: 200,
        // step 1: set child as ListView
        child: ListView(
          children: <Widget>[
            // step 2: set ListTiles which have leading, title, trailing, onTap and other options

          ],
        ),
      ),
    );
  }
}