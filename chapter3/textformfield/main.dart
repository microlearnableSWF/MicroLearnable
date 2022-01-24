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
      title: 'TextFormField',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextFormFieldPractice(),
    );
  }
}

class TextFormFieldPractice extends StatelessWidget {
  // step 1: set TextEditingController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            // step 2: set TextFormField
            TextFormField(
              // step 3: set controller, onChanged and onEditingComplete
              

              //step 4: set some decorations
             
            ),

            // step 5: set clear button
           
          ],
        ),
      ),
    );
  }
}
