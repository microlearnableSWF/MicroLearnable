import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  
  //Input your web app's Firebase configuration
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "",
          authDomain: "",
          projectId: "",
          storageBucket: "",
          messagingSenderId: "",
          appId: "",
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              signUpTextFormField('Email', emailController),
              passwordTextFormField('Password', passwordController),
              signUpTextFormField('Name', nameController),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        signUpWithEmailandPassword().whenComplete(() {
                          emailController.clear();
                          passwordController.clear();
                          nameController.clear();
                        });
                      }
                    },
                    child: Text('Sign In')),
              ),
            ],
          ),
        ),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $name';
              }
              return null;
            },
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
            obscureText: true,
            validator: (value) {
              if (value == null || value.length < 6) {
                return 'Please enter more than 6 words';
              }
              return null;
            },
          ),
        )
      ],
    );
  }

  Future<void> signUpWithEmailandPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      FirebaseFirestore.instance
          .collection('user')
          .doc(emailController.text)
          .set({
        'email': emailController.text,
        'name': nameController.text
      })
          .then((value) => print('User Added'))
          .catchError((error) => print('Failed to add user: $error'));

      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The account already exists for that email.'),
          duration: Duration(seconds: 2),
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
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String email, nickName;

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
                await FirebaseAuth.instance
                    .signOut()
                    .whenComplete(() => Navigator.of(context).pop());
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(auth.currentUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                String? name = snapshot.data!['name'];
                return Text(
                  'Welcome $name!',
                  style: TextStyle(fontSize: 30),
                );
              } else {
                return LinearProgressIndicator();
              }
            }),
      ),
    );
  }
}
