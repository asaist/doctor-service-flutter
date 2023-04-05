import 'dart:convert';

class Sex {
  final int? id;
  final String? name;

  const Sex({required this.id, required this.name});

  factory Sex.fromJson(String str) => Sex.fromMap(json.decode(str));

  factory Sex.fromMap(Map<String, dynamic> json) {
    return Sex(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && other is Sex && id == other.id;

  @override
  int get hashCode => super.hashCode;
}
