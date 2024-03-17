import 'package:commanddash/models/workspace_file.dart';

abstract class Input {
  String id;
  String type;
  Input(this.id, this.type);

  factory Input.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    // TODO: parse if jsons
    if (type == "string_input") {
      return StringInput.fromJson(json);
    } else if (type == "code_input") {
      return CodeInput.fromJson(json);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String toString();
}

class StringInput extends Input {
  String value;
  StringInput(String id, this.value) : super(id, 'string_input');

  factory StringInput.fromJson(Map<String, dynamic> json) {
    return StringInput(
      json['id'],
      json['value'],
    );
  }

  @override
  String toString() {
    return value;
  }
}

class CodeInput extends Input {
  String filePath;
  Range range;
  String content;
  CodeInput(String id, this.filePath, this.range, this.content)
      : super(id, 'code_input');

  factory CodeInput.fromJson(Map<String, dynamic> json) {
    return CodeInput(
      json['id'],
      json['filePath'],
      Range.fromJson(json['range']),
      json['content'],
    );
  }

  @override
  String toString() {
    return content;
  }
}