import 'dart:convert';

class ProtocolField {
  int id;
  String name;
  String? result;

  ProtocolField({required this.id, required this.name, this.result});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "result": result,
    };
  }

  factory ProtocolField.fromJson(String str) =>
      ProtocolField.fromMap(json.decode(str));

  factory ProtocolField.fromMap(Map<String, dynamic> json) {
    return ProtocolField(
      id: json['id'],
      name: json['name'],
      result: json['result'],
    );
  }
}
