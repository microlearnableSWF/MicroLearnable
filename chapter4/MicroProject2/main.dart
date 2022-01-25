import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
// * use your firebase configuration
//   await Firebase.initializeApp(
//       options: const FirebaseOptions(
//        apiKey: "AIzaSyCbxqPMZaWbPtwY_LaddkoUuQC_-RZZ4vo",
//        authDomain: "unitwin-b11a6.firebaseapp.com",
//        projectId: "unitwin-b11a6",
//        storageBucket: "unitwin-b11a6.appspot.com",
//        messagingSenderId: "1075604622349",
//        appId: "1:1075604622349:web:fab6b03348000925051944"
//   ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
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
                    child: const Text('Login')),
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  TextButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: const Text(
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
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // make navigation to Homepage in practice
     
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