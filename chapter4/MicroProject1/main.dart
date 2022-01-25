import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
  Make pages as similar as possible.
  In order to do this MicroProject, please refer to the previous lesson.

  step 1: Visit https://firebase.google.com/ and create project. 

  step 2: In the project, select web as the application. 

  step 3: start Authentication's sign-in-method as 'email/password'

  step 4: start FireStore in test mode
*/

void main() async {
  /*
    Firebase.initializeApp() needs to call native code to initialize Firebase,
    and since the plugin needs to use platform channels to call the native code,
    which is done asynchronously therefore you have to call ensureInitialized()
    to make sure that you have an instance of the WidgetsBinding
  */
  
  // * change this with your firebase configuration! Copy the configuration in your firebase project settings.
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "",
          authDomain: "",
          projectId: "",
          storageBucket: "",
          messagingSenderId: "",
          appId: ""
      ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  Practice 1: make Login page
  There are Image, two TextFormField, ElevatedButton and TextButton.
  In this class, you should use firebase auth for sign in using signInWithEmailAndPassword method.
  when ElevatedButton pressed, navigate to HomePage
  when TextButton pressed, navigate to SignUpPage
*/
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // make two TextEditingController for email and password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*
              Set the children with Image, two textFormField(email and password), ElevatedButton and TextButton
              use const FlutterLogo(size:100), for image
              Add TextEditingController in TextFormField
              when ElevatedButton(Login) pressed, call loginWithEmailAndPassword() and clear TextEditingController
              if login success, navigate to HomePage -> Imply in loginWithEmailAndPassword() function
              when TextButton(Sign Up) pressed, navigate to SignUpPage
              */
            ],
          ),
        ));
  }

  /*
    We need times for getting, setting data from database, so we use Future method for get some times.
    In Future methods, use async for using 'await' which waits until the function ends.
    In this function, if signInWithEmailAndPassword success, navigate to homepage
    else, catch error and show SnackBar for each cases
    you can check signInWithEmailAndPassword method in https://firebase.flutter.dev/docs/auth/usage
  */
  Future<void> loginWithEmailAndPassword() async {
    try {
      // sign in with email and password using signInWithEmailAndPassword()
      // change '' to each TextEditingController.text
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: '', password: '');

      // you will make navigation to Homepage in MicroProject 3

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // set SnackBar and content as Text('No user found for that email')

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // set SnackBar and content as Text('Wrong password provided for that user.')

        print('Wrong password provided for that user.');
      }
    }
  }
}