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
    Firebase.initializeApp() needs to call native code to initialize Firebase,
    and since the plugin needs to use platform channels to call the native code,
    which is done asynchronously therefore you have to call ensureInitialized()
    to make sure that you have an instance of the WidgetsBinding
  */
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCbxqPMZaWbPtwY_LaddkoUuQC_-RZZ4vo",
          authDomain: "unitwin-b11a6.firebaseapp.com",
          projectId: "unitwin-b11a6",
          storageBucket: "unitwin-b11a6.appspot.com",
          messagingSenderId: "1075604622349",
          appId: "1:1075604622349:web:fab6b03348000925051944"
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
              // make Image, two textFormField(email and password), ElevatedButton and TextButton
              // You can add image you want
              // Add TextEditingController in TextFormField
              // when ElevatedButton(Login) pressed, call loginWithEmailAndPassword() and clear TextEditingController
              // if login success, navigate to HomePage -> Imply in loginWithEmailAndPassword() function
              // when TextButton(Sign Up) pressed, navigate to SignUpPage
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

/*
  microProject 2: make SignUpPage
  Make three TextFormFields in Form and ElevatedButton.
  when you clicked button, create email and password sign in.
  if creating auth fails, show SnackBar for each case
*/
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // make three TextEditingController for email and password

  // set formKey as GlobalKey<FormState>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // make navigation to pop
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        // Change Container to Form before Column
        // set three TextFormField widget(using signUpTextFormField() and passwordTextFormField() functions)
        // set ElevatedButton in Container(width: double.infinity,)
        // when ElevatedButton(Sign In) pressed, set function as
        // if (_formKey.currentState!.validate()) {
        //    signUpWithEmailAndPassword().whenComplete(() {
        //    emailController.clear();
        //    passwordController.clear();
        //    nameController.clear();
        // });
        child: Container()
      ),
    );
  }

  Widget signUpTextFormField(String name, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 25),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: name,
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.zero),
            // set validator
            // if value is null or imEmpty, return 'Please enter $name'
            // else return null
          ),
        )
      ],
    );
  }

  Widget passwordTextFormField(String name, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 25),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: name,
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.zero),
            // set obscureText true

            // set validator
            // if value is null or less than 6 words, return 'Please enter more than 6 words'
            // else return null

          ),
        )
      ],
    );
  }

  /*
    In this function, if createUserWithEmailAndPassword success, store data in FireStore navigate to LoginPage
    else, catch error and show SnackBar for each cases
    you can check createUserWithEmailAndPassword method in https://firebase.flutter.dev/docs/auth/usage
  */
  Future<void> signUpWithEmailAndPassword() async {
    try {
      // sign in with email and password using signInWithEmailAndPassword()
      // change '' to each TextEditingController.text
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: '', password: '');

      // This is a function for create data in FireStore(DB)
      // change doc's '' to emailController.text
      // change set's '' to each controller like 'email': emailController.text,
      // * when this function called, Collection named user will be created in firebase fireStore
      // and set document, which has email and name, in user's collection named email
      // you can check in firebase console!
      FirebaseFirestore.instance
          .collection('user')
          .doc('')
          .set({
        'email': '',
        'name': ''
      })
          .then((value) => print('User Added'))
          .catchError((error) => print('Failed to add user: $error'));

      // make navigation to pop

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

        // set SnackBar and content as Text('The account already exists for that email.')
      }
    } catch (e) {
      print(e);
    }
  }
}

/*
  Practice 3: make HomePage
  Make StreamBuilder to get data from FireStore(DB)
  when you clicked TextButton(Logout) in AppBar, signOut in firebase auth and navigation to pop
*/
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This is FirebaseAuth variable.
  // you can use this for getting currentUser or login, signIn etc
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                // This function is for signOut
                await FirebaseAuth.instance
                    .signOut()
                    .whenComplete(() {
                  // make navigation to pop
                });
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: Center(
        // set StreamBuilder
        // set stream as FirebaseFirestore.instance
        //                 .collection('user')
        //                 .doc(auth.currentUser!.email)
        //                 .snapshots()
        // * this stream gets data from user collection's document which document's name is current user's email
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(auth.currentUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              // if stream has data, return Text
              // else return LinearProgressIndicator()
              if (snapshot.hasData){
                // Change Container to Text, use String variable 'name'
                // * if you want to use data from fireStore, use like this
                String? name = snapshot.data!['name'];
                return Container();
              } else {
                return LinearProgressIndicator();
              }
            }),
      ),
    );
  }
}