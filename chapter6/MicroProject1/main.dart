import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
  Each Pages have class(Login, SignUp, Home).
  Make each page as similar as the example.
  Before you starts coding, set Firebase as follow

  step 1: set Firebase project

  step 2: starts with web, write app name as your name or whatever

  step 3: Copy the apiKey ~ measurementId which is in firebaseConfig
  * const firebaseConfig = {
          apiKey:
          ~
          appId:
    }

  step 4: starts Firebase in void main() function like

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCJXYXP7ouBucq9aOIWn-dzvKzi3lSY4ks",
          authDomain: "dartpad-test-cd484.firebaseapp.com",
          projectId: "dartpad-test-cd484",
          storageBucket: "dartpad-test-cd484.appspot.com",
          messagingSenderId: "646249461323",
          appId: "1:646249461323:web:0f0c8c74e56d9a07afffce",
  ));

  step 5: start Authentication's sign-in-method as 'email/password'

  step 6: start FireStore in test mode
*/

void main() async {
  /*
   * use your firebase configuration
   await Firebase.initializeApp(
       options: const FirebaseOptions(
           apiKey: "AIzaSyCbxqPMZaWbPtwY_LaddkoUuQC_-RZZ4vo",
           authDomain: "unitwin-b11a6.firebaseapp.com",
           projectId: "unitwin-b11a6",
           storageBucket: "unitwin-b11a6.appspot.com",
           messagingSenderId: "1075604622349",
           appId: "1:1075604622349:web:fab6b03348000925051944"
    ));
  */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chapter 5 practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Colors.white,
          )),
      home: LoginPage(),
    );
  }
}

/*
  practice 1: make LoginPage
  this class is same as chapter 4 login pages so we'll remain just skeleton code for your coding ability
  you can do it!
*/
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // make flutter logo, two TextFormField, ElevatedButton, TextButton
            ],
          ),
        ));
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      // sign in with email and password

      // navigate to ChattingPage

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {

        print('Wrong password provided for that user.');
      }
    }
  }
}