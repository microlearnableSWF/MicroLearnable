import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Step 1, initialize firebase
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
      home: FirebasePractice(),
    );
  }
}

class FirebasePractice extends StatefulWidget {
  @override
  State<FirebasePractice> createState() => _FirebasePracticeState();
}

class _FirebasePracticeState extends State<FirebasePractice> {
  // Step 2, instantiate FirebaseAuth

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Authentication Anonymous'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Step 3, call createEmailAndPassword function
                  createEmailAndPassword();
                },
                child: const Text('create auth with Email and Password'),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Step 4, call signInEmailAndPassword function
                  signInEmailAndPassword();
                },
                child: const Text('login with Email and Password'),
              ),
            ),
          ],
        ));
  }

  void signInEmailAndPassword() async {
    // make signInWithEmailAndPassword function.
    // * set email as 'microLearnable@gmail.com' and password as '123123'
    // when function complete, navigate to HomePage
    print('sign in');
  }

  void createEmailAndPassword() async {
    // make createUserWithEmailAndPassword function
    // * set email as 'microLearnable@gmail.com' and password as '123123'
    // when function complete, print('auth created')
  }
}

class HomePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Step 5, get access to current user's information
    String authEmail = auth.currentUser!.email.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Success!'),
      ),
      body: Center(
        // Step 6, Make button for signout
        child: ElevatedButton(
          onPressed: () async {
            // call signOut function
            // when function complete, navigate to pop
          },
          child: Text('$authEmail Sign Out!'),
        ),
      ),
    );
  }
}