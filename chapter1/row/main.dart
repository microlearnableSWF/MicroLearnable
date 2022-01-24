import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Row',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RowPractice());
  }
}

// TODO - Practice Row
class RowPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        height: 500,
        color: Colors.blue,
        // Step 1, set the child as Row.
        child: Row(
          // Step 2, set children widgets in Row (try anything)
          
          // Step 3, set alignment horizontally (center, start, end)

          // Step 4, set alignment vertically (center, start, end)

        ),
      ),
    );
  }
}
