import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "",
          authDomain: "",
          projectId: "",
          storageBucket: "",
          messagingSenderId: "",
          appId: ""));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Page'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInWithEPPage())
                );
              },
              child: const Text('Sign in with Email and Password'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                signInWithAnonymous();
              },
              child: const Text('Sign in with anonymous'),
            ),
          ),
        ],
      ),
    );
  }

  void signInWithAnonymous() async{
    auth.signInAnonymously().whenComplete(() =>
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomePage())
        )
    );
    print('sign in with anonymous');
  }
}


class SignInWithEPPage extends StatefulWidget {
  @override
  State<SignInWithEPPage> createState() => _SignInWithEPPageState();
}

class _SignInWithEPPageState extends State<SignInWithEPPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final signInEmailController = TextEditingController();
  final signInPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In Page'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: signInEmailController,
                  decoration: const InputDecoration(
                      hintText: 'Email'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: signInPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Password'
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    signInEmailAndPassword();
                  },
                  child: const Text('Sign In'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        createEmailAndPassword();
                      },
                      child: const Text('create user', style: TextStyle(color: Colors.grey),),
                    ),
                  ),
                ],)
            ],
          ),
        )
    );
  }

  void signInEmailAndPassword() async{
    try {
      await auth.signInWithEmailAndPassword(email: signInEmailController.text, password: signInPasswordController.text);

      print('sign in');

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomePage())
      );

      signInEmailController.clear();
      signInPasswordController.clear();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('No user found for that email'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'exit',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Wrong password provided for that user.'),
              duration: const Duration(seconds: 2),
              action: SnackBarAction(
                label: 'exit',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));

        print('Wrong password provided for that user.');
      }
    }
  }

  void createEmailAndPassword() async{
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Create user'),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email'
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Password'
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async{
                    try {
                      await auth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                          .whenComplete(() {
                        dialogButtonClicked();
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('The account already exists for that email.'),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'exit',
                            onPressed: () {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                        ));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Add user')
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

  void dialogButtonClicked() {
    emailController.clear();
    passwordController.clear();
    Navigator.of(context).pop();
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String user = auth.currentUser!.isAnonymous
        ? 'anonymous'
        : auth.currentUser!.email.toString();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async{
              await auth.signOut().whenComplete(() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInPage())
                );
                print('Sign out');
              });
            },
            icon: const Icon(Icons.arrow_back)
        ),
        title: Text('Hello $user!'),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('students_votes').snapshots(),
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
    Student student = Student.fromDs(data);

    return ListTile(
      onLongPress: () {
        deleteStudents(student.name);
      },
      leading: Text(student.count.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      title: Text(student.name),
      subtitle: Text(student.course),
      trailing: IconButton(
        icon: const Icon(Icons.thumb_up),
        onPressed: () async{
          await FirebaseFirestore.instance.collection('students_votes').doc(student.name).update({
            'count': student.count++
          });
        },
      ),
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
                    await FirebaseFirestore.instance.collection('students_votes').doc(nameController.text).set({
                      'name' : nameController.text,
                      'course' : courseController.text,
                      'count' : 0
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

  void dialogButtonClicked() {
    nameController.clear();
    courseController.clear();
    Navigator.of(context).pop();
  }

  void deleteStudents(String name) async{
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('delete $name'),
            actions: [
              TextButton(
                  onPressed: () async{
                    await FirebaseFirestore.instance.collection('students_votes').doc(name).delete();
                    Navigator.of(context).pop();
                  },
                  child: const Text('delete', style: TextStyle(color: Colors.red),)
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('cancel')
              ),
            ],
          );
        }
    );
  }
}

class Student {
  String name;
  String course;
  int count;

  Student({required this.name, required this.course, required this.count});

  factory Student.fromDs(dynamic data) {
    return Student(
        name: data['name'] ?? '',
        course: data['course'] ?? '',
        count: data['count'] ?? 0
    );
  }
}