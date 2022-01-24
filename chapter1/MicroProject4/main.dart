import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            children: [
              practice2(),
              practice3(),
              // Practice 4: set Dividers among practice4()
              practice4(),
            ],
          ),
        ));
  }

  Widget practice2() {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/11/14/09/14/cat-1822979_1280.jpg'),
          ),
        ),
      ),
    );
  }

  Widget practice3() {
    return Padding(
      // you can change padding as much as you want
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hong Gildong',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '(woman, 9)',
                style: TextStyle(fontSize: 17, color: Colors.grey),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.thumb_up,
            color: Colors.orange,
            size: 27,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text('41', style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }

  /* Practice 4: Make Name and Icon
   Using Padding, Row, Column, Text, Expanded(SizedBox), Icon
     Use Column and Row for placing Texts and Icon.
     In Column, use Alignment for placing widgets
     Use Expanded, SizedBox for empty space between name and Icon
  */
  Widget practice4() {
    return Padding(
      // you can change padding, a size of Icon, Text as much as you want
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
      child: Row(
        children: [
          // set three Columns which have Icon(Icons.thumb_up) and Text widget.
        ],
      ),
    );
  }
}
