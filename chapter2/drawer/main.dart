import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer',
      theme: ThemeData(primaryColor: Colors.white),
      home: DrawerPractice(),
    );
  }
}

// TODO: Practice implementing drawer
class DrawerPractice extends StatefulWidget {
  @override
  _DrawerPracticeState createState() => _DrawerPracticeState();
}

class _DrawerPracticeState extends State<DrawerPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      //Step 1, set drawer in scaffold

      //Step 2, set drawer header in drawer

      //Step 3, set child widgets in drawer
    );
  }
}
