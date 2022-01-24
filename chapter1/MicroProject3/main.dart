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
            children: [
              practice2(),
              practice3(),
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

  /*
		Use Padding, Row, Column, Text, Expanded(SizedBox), Icon widgets.
		  - Use Column and Row for placing Text and Icon widgets.
		  - In Column, use Alignment for placing widgets.
		  - Use Expanded, SizedBox for empty spaces between name and icon.
  */
  Widget practice3() {
    return Padding(
      // You can change padding properties as much as you want.
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
      child: Row(
        children: [
          /* 
						Set Column, Expanded(SizedBox), Icon, Text
	            - If you want space between Icon and Text, use SizedBox.
	            - Icon: Icons.thumb_up
          */
        ],
      ),
    );
  }
}
