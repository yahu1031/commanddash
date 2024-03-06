import 'dart:convert';

import 'package:dash_agent/dash_agent.dart';
import 'package:flutter_test/flutter_test.dart';

import '../user_implementation/main.dart';

void main() {
  test('adds one to input values', () async {
    final myagent = await processAgent(MyAgent());
    print(jsonEncode(myagent));
  });
}
