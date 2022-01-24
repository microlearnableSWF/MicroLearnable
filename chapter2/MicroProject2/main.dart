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
            // you can change padding as much as you want
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
        drawer: microProject1());
  }

  Drawer microProject1() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text(
                'Hong Gil-Dong',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              alignment: Alignment.bottomLeft,
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: const [
                Icon(
                  Icons.phone,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Phone',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: const [
                Icon(
                  Icons.email,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
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
    return Row(
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

          // Here we are going to replace the like button that actually does something.
          // Let's implement the code in microProject2 section.
          microProject2(),
        ],
    );
  }

  /* MicroProject #2 : Make Like Button Alive
      - Set two variables (you can change variable name and value if you want)
      - Set IconButton and make it change when the button is pressed
  */

  // Variable that stores state of the button
  bool isLiked = false;
  // Variable that stores the number of likes
  int likes = 41;

  Widget microProject2() {
    return Row(children: [
      // TODO: Make icon button with IconButton widget
        // Set Icon
        // TODO: Set icon that indicates state of the button (isLiked ? Icons.thumb_up : Icons.thumb_up_outlined)
        // TODO: Set icon's color(oragne) and size

        // Set actions when button is pressed
        // TODO: Change the values of the variables when icon is clicked using setState()
        //        -if isLiked == true: likes++, isLiked = true
        //        -if isLiked == false: likes--, isLiked = false
      const SizedBox(
        width: 5,
      ),
      // This indicates the value of likes variable
      Text('$likes', style: const TextStyle(fontSize: 18))
    ]);
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