import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Step 1, initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
);

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
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Step 3, Implement signInWithAnonymous function.
              signInWithAnonymous();
            },
            child: const Text('login with anonymous'),
          ),
        ));
  }

  void signInWithAnonymous() async {
   
  }
}

class HomePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Step 4, set authId with currentUser's uid.
    String authId = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Success!'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
           // Step 5, set signOut.
          },
          child: Text('$authId Sign Out!'),
        ),
      ),
    );
  }
}
