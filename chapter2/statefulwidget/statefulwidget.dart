import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StatefulWidget',
      theme: ThemeData(primaryColor: Colors.white),
      home: StateFulPractice(),
    );
  }
}

// step 1: set class that extends StatefulWidget
class StateFulPractice extends StatefulWidget {
  @override
  _StateFulPracticeState createState() => _StateFulPracticeState();
}

class _StateFulPracticeState extends State<StateFulPractice> {
  // step 2: declare a variable that stores state of button
  bool isButtonOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isButtonOn == false ? Colors.lightBlueAccent : Colors.yellow,
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              // step 3: change state of the button with setState()
                // step 4: implement [isButtonOn = !isButtonOn;] in setState()
            },
            child: const Text('Change background color')),
      ),
    );
  }
}
