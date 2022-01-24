import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Start with the Firebase Create & Read code
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
         apiKey: "",
    authDomain: "",
    projectId: "",
    storageBucket: "",
    messagingSenderId: "",
    appId: ""
      ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebasePractice(),
    );
  }
}

class FirebasePractice extends StatefulWidget {
  @override
  State<FirebasePractice> createState() => _FirebasePracticeState();
}

class _FirebasePracticeState extends State<FirebasePractice> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Firestore'),
          centerTitle: true,
          elevation: 0,
        ),
        body: StreamBuilder<QuerySnapshot>(
          // set stream from collection 'students'
          stream: ,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data!.size == 0) {
                return Center(
                  child: Container(
                    width: 220,
                      child: const Text('There is no data in Firebase!\n Add data using Floating button')),
                );
              } else {
                // set ListTiles in ListView using map - toList
                return ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot data) => _buildListTile(data))
                      .toList(),
                );
              }
            }},
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createStudent();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListTile(DocumentSnapshot data) {
    // set data in variable type Student
    Student student = Student.fromDs(data);

    return ListTile(
      onLongPress: () {
        deleteStudents(student.name);
      },
      title: Text(student.name),
      subtitle: Text(student.course),
      trailing: const Icon(Icons.favorite, color: Colors.red,),
      // change Icon to IconButton
      // if button pressed, update 'students' collection as
      // 'liked': !student.liked
      // if student.liked is true, set icon as Icons.favorite or set Icons.favorite_border
      
    );
  }

  void createStudent() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Create student'),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name'
                    ),
                  ),
                  TextFormField(
                    controller: courseController,
                    decoration: const InputDecoration(
                        hintText: 'Course'
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async{
                    await FirebaseFirestore.instance.collection('students').doc(nameController.text).set({
                      'name' : nameController.text,
                      'course' : courseController.text,
                      'liked' : false
                    }).whenComplete(() {
                      dialogButtonClicked();
                      print('student add');
                    });
                  },
                  child: const Text('Add data')
              ),
              TextButton(
                  onPressed: () {
                    dialogButtonClicked();
                  },
                  child: const Text('Cancel', style: TextStyle(color: Colors.red),)
              ),
            ],
          );
        }
    );
  }

  void deleteStudents(String name) async{
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Delete $name'),
            actions: [
              TextButton(
                  onPressed: () async{
                    // Delete data which is in collection('students').doc(name)
                    // navigate to pop
                  },
                  child: const Text('Delete', style: TextStyle(color: Colors.red),)
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')
              ),
            ],
          );
        }
    );
  }

  void dialogButtonClicked() {
    nameController.clear();
    courseController.clear();
    Navigator.of(context).pop();
  }
}

class Student {
  String name;
  String course;
  bool liked;

  Student({required this.name, required this.course, required this.liked});

  factory Student.fromDs(dynamic data) {
    return Student(
        name: data['name'] ?? '',
        course: data['course'] ?? '',
      liked: data['liked'] ?? false
    );
  }
}