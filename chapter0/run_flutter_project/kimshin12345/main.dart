import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drag App',
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list = List.generate(100, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(list[index]),
          onDismissed: (event) {
            setState(() {
              list.removeAt(index);
            });
          },
          child: ListTile(title: Center(child: Text(list[index].toString()))),
          background: Container(
            color: Colors.amber,
          ),
        );
      },
      itemCount: list.length,
    );
  }
}

void _result(bool success, [List<String> messages = const []]) {
  // Join messages into a comma-separated list for inclusion in the JSON array.
  final joinedMessages = messages.map((m) => '"$m"').join(',');
  print('__TESTRESULT__ {"success": $success, "messages": [$joinedMessages]}');
}

// Ensure we have at least one use of `_result`.
var resultFunction = _result;

// Placeholder for unimplemented methods in dart-pad exercises.
// ignore: non_constant_identifier_names, sdk_version_never
Never TODO([String message = '']) => throw UnimplementedError(message);
