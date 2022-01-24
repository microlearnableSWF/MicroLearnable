import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPracticePractice(),
    );
  }
}

// TODO: Practice using Form and form key to validate input
class FormPracticePractice extends StatefulWidget {
  @override
  _FormPracticePracticeState createState() => _FormPracticePracticeState();
}

class _FormPracticePracticeState extends State<FormPracticePractice> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // step 1: set form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Practice',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        // step 3: set Form widget
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              nameTextFormField('Name', nameController),
              passwordTextFormField('Password', passwordController),
              emailTextFormField('Email', emailController),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        emailController.clear();
                        passwordController.clear();
                        nameController.clear();
                      }
                    },
                    child: const Text('Sign In')),
              ),
            ],
          ),
        ),
      ),
    );
  }

// step 2: customize TextFormField widget
  Widget nameTextFormField(String name, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 25),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: name,
            ),
            // step 4: set name validator as below
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
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 25),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: name,
            ),
            obscureText: true,
            // step 5: set password validator as below
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

  Widget emailTextFormField(String name, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 25),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: name,
            ),
            // step 6: set email validator as below
            validator: (value) {
              if (value == null) {
                return 'Please enter $name';
              } else {
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Please make $name form';
                }
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
