import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Center(
        child: Text(
          'Hello, world!',
          textDirection: TextDirection.ltr,
        ),
      ),
    )
  );
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
