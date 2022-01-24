import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilderPractice(),
    );
  }
}

// TODO: Practice using StreamBuilder.
class StreamBuilderPractice extends StatefulWidget {
  const StreamBuilderPractice({Key? key}) : super(key: key);

  @override
  State<StreamBuilderPractice> createState() => _StreamBuilderPracticeState();
}

class _StreamBuilderPracticeState extends State<StreamBuilderPractice> {
  // step 1: set StreamController<String> type variable named streamController
  StreamController<String> streamController = StreamController<String>();

  // step 2: set override function initState()

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      streamController.add("check!");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // step 3: set StreamBuilder

          child: StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) {
              // step 4: use the streamed data
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 35),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
    );
  }
}