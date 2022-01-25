import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              SizedBox(
                height: 250,
                child: Container(),
              ),
              const FlutterLogo(size:100),
              SizedBox(
                height: 100,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      loginWithIdandPassword();
                      emailController.clear();
                      passwordController.clear();
                    },
                    child: Text('Login')),
              ),
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.grey),
                      ))
                ],
              )
            ],
          ),
        ));
  }


  Future<void> loginWithIdandPassword() async {
    try {
      // sign in with email and password using signInWithEmailAndPassword()
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // navigate to Homepage
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ChattingPage()),
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('No user found for that email'),
          duration: Duration(seconds: 2),
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
          // step 3: set SnackBar content, duration and action
            SnackBar(
              content: Text('Wrong password provided for that user.'),
              duration: Duration(seconds: 2),
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
}

/*
  Practice 2: make SignUpPage
  This page is an example that you already have implemented in chapter 3
  Try to make this page yourself!
*/
enum Gender { man, woman }

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.keyboard_backspace),
        ),
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            signUpTextFormField('Name', nameController),
            signUpTextFormField('email', emailController),
            passwordTextFormField('Password', passwordController),
            practice2(),
            practice3(),
            practice4(),
            practice5(),
            practice6(),
          ],
        ),
      ),
    );
  }

  // practice 2_1: make TextFormField
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Widget signUpTextFormField(String name, TextEditingController controller) {
    return Container();
  }

  Widget passwordTextFormField(String name, TextEditingController controller) {
    return Container();
  }
  // practice 2_2: make date picker
  DateTime currentDate = DateTime.now();

  Widget practice2() {
    return Container();
  }

  Future<void> selectedDate() async {

  }

  // practice 2_3: make radio button
  Gender _gender = Gender.man;
  Widget practice3() {
    return Container();
  }

  // practice 2_4: make dropdown menu
  var dropDownList = ['Highschool', 'University', 'Colleage', 'Graduate'];
  var dropDownListValue = 'Highschool';

  Widget practice4() {
    return Container();
  }

  // practice 2_5: make switch
  bool _isSwithChecked = false;
  Widget practice5() {
    return Container();
  }

  // practice 2_6: make switch
  Widget practice6() {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if(_formkey.currentState!.validate()){
            // show AlertDialog to show the information about users
            // make title named 'preview'
            // set two TextButtons in actions
            // exit button for navigate pop
            // save button for call signUpWithEmailAndPassword()
          }
        },
        child: Text(
          'Join',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  /*
    In this function, if createUserWithEmailAndPassword success, navigate to loginpage
    else, catch error and show SnackBar for each cases
    you can check createUserWithEmailAndPassword method in https://firebase.flutter.dev/docs/auth/usage
  */
  Future<void> signUpWithEmailAndPassword() async {
    try {
      // create user with email and password using createUserWithEmailAndPassword()

      // This function is for Firebase fireStore which set name, email,
      // birth, gender, currentEducation, revealToThePublic to fireStore.
      // use FirebaseFirestore.instance
      //           .collection('user')
      //           .doc(emailController.text)
      //           .set({}).then((value) => print('User Added'))
      //           .catchError((error) => print('Failed to add user: $error'));
      // Check your firebase fireStore!

      // make navigation to LoginPage

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // show snackbar

        // make navigation to pop
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}