import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InteractiveResume(),
    );
  }
}

class InteractiveResume extends StatefulWidget {
  @override
  _InteractiveResumeState createState() => _InteractiveResumeState();
}

class _InteractiveResumeState extends State<InteractiveResume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Resume',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                imageSection(),
                nameSection(),
                const Divider(
                  thickness: 2,
                ),
                buttonSection(),
                const Divider(
                  thickness: 2,
                ),
                textSection(),
              ],
            ),
          ),
        ),

        // Add a Drawer.
        // Let's implement the code in microProject1 section.
        drawer: microProject1());
  }

  /*
    MicroProject #1: Add Drawer to Resume
	    - Make DrawerHeader and two widgets in ListView
  */
  Drawer microProject1() {
    return const Drawer(
        // TODO: Set DrawerHeader using Container to align(Alignment.bottomLeft) and wrap Text widget with Padding

        // TODO: Set ListView and place two Container widgets with Icon and Text

        // TODO: Set Padding value, Icon size as you want

        );
  }

  Widget imageSection() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
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
      ),
    );
  }

  Widget nameSection() {
    return Padding(
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
          Row(children: const [
            Icon(
              Icons.thumb_up,
              color: Colors.orange,
              size: 27,
            ),
            SizedBox(
              width: 5,
            ),
            Text('41', style: TextStyle(fontSize: 18)),
          ])
        ],
      ),
    );
  }

  Widget buttonSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
              ),
              const Text(
                'PHONE',
                style: TextStyle(color: Colors.blue, fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
              ),
              const Text(
                'EMAIL',
                style: TextStyle(color: Colors.blue, fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
              ),
              const Text(
                'ADDRESS',
                style: TextStyle(color: Colors.blue, fontSize: 13),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget textSection() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Introduce Yourself',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae lacinia ligula. In blandit consequat rutrum.',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            )
          ],
        ));
  }
}