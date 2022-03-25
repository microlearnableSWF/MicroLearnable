dynamic main_test() {
	int num = 10;

	print(num);

	return num;
}
// 테스트 중입니다.

// 김신 원본 저장함
void main() {
  try {
    final num = main_test(); 

    if (num == 10) {
      _result(true);
    } else {
      _result(false, ['You should print 10']);
    }
  } catch (e) {
    _result(false, ['Tried calling main_test(), but received an exception: ${e.runtimeType}']);
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
