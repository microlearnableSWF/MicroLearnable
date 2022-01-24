import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigatorPractice(),
    );
  }
}
// TODO: Practice using navogator.
class NavigatorPractice extends StatefulWidget {
  @override
  _NavigatorPracticeState createState() => _NavigatorPracticeState();
}

class _NavigatorPracticeState extends State<NavigatorPractice> {
  @override
  Widget build(BuildContext context) {
    // step 1: set appBar and body as Center, ElevatedButton.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
            // step 3: set ElevatedButton onPressed option to navigate 'SecondPage'
            child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SecondPage()));
          },
          child: const Text('Navigate to Second page'),
        )));
  }
}

// step 2: make class 'SecondPage' which extends StatefulWidget
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    // step 4: set Scaffold, appBar and body
    return Scaffold(
      appBar: AppBar(
        // step 5: set appBar's leading as IconButton which navigates previous page
        title: const Text('Second Page'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      // step 6: make Text to show that this is second page
      body: const Center(
        child: Text('This is Second page'),
      ),
    );
  }
}
