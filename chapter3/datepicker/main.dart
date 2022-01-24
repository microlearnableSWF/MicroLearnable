import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DatePicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DatePickerPractice(),
    );
  }
}

// TODO: Practice using DatePicker widget
class DatePickerPractice extends StatefulWidget {
  @override
  _DatePickerPracticeState createState() => _DatePickerPracticeState();
}

class _DatePickerPracticeState extends State<DatePickerPractice> {
  // step 1: set DateTime variable name currentDate as DateTime.now()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            // step 2: make ElevatedButton

            ));
  }

  // step 3: make selectedDate function
  Future<void> selectDate() async {}
}
