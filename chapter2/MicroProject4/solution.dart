import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day2Prototype(),
    );
  }
}

class Day2Prototype extends StatefulWidget {
  @override
  _Day2PrototypeState createState() => _Day2PrototypeState();
}

class _Day2PrototypeState extends State<Day2Prototype> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Resume',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              imageSection(),
              nameSection(),
              Divider(
                thickness: 2,
              ),
              buttonSection(),
              Divider(
                thickness: 2,
              ),
              textSection(),
            ],
          ),
        ),
        drawer: practice1());
  }

  Widget imageSection() {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
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

  Widget nameSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          Expanded(child: SizedBox()),
          practice2(),
          SizedBox(
            width: 5,
          ),
          Text(liked.toString(), style: TextStyle(fontSize: 18))
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
              Container(
                margin: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {
                    practice3();
                  },
                  icon: Icon(
                    Icons.phone,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
              ),
              Text(
                'PHONE',
                style: TextStyle(color: Colors.blue, fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {
                    practice4();
                  },
                  icon: Icon(
                    Icons.email,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
              ),
              Text(
                'EMAIL',
                style: TextStyle(color: Colors.blue, fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () {}, 
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 35,),
                    ),
              ),
              Text(
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
          children: [
            Text(
              'Introduce',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae lacinia ligula. In blandit consequat rutrum. Suspendisse volutpat blandit neque vel tristique. Curabitur tincidunt aliquam mi, eget ultricies nibh tempus eu. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam vestibulum id mi ac iaculis. Vivamus sit amet tincidunt velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            )
          ],
        ));
  }

  Drawer practice1() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Hong Gil-Dong',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              alignment: Alignment.bottomLeft,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: [
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
              children: [
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

  bool isLiked = false;
  int liked = 41;

  Widget practice2() {
    return IconButton(
      onPressed: () {
        setState(() {
          if (isLiked) {
            liked--;
            isLiked = false;
          } else {
            liked++;
            isLiked = true;
          }
        });
      },
      icon: Icon(
        isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
        color: Colors.orange,
        size: 27,
      ),
    );
  }

  void practice3() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('010-0000-0000'),
        duration: Duration(seconds: 1),
        action: SnackBarAction(
          label: 'exit',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
    ));
  }
  
  void practice4() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('E-mail'),
            content: Text('swfact114@gmail.com'),
            actions: [
              TextButton(
                  onPressed: () {
                    print('exit pressed');
                  },
                  child: Text(
                    'exit',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ))
            ],
          );
        });
  }
}