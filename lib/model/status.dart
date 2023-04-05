import 'dart:convert';

class Status {
  final int id;
  final String name;

  const Status({required this.id, required this.name});

  factory Status.fromJson(String str) => Status.fromMap(json.decode(str));

  factory Status.fromMap(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && other is Status && id == other.id;

  @override
  int get hashCode => super.hashCode;
}
