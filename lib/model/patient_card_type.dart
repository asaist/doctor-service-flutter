import 'dart:convert';

class PatientCardType {
  final int? id;
  final String? name;

  const PatientCardType({required this.id, required this.name});

  factory PatientCardType.fromJson(String str) =>
      PatientCardType.fromMap(json.decode(str));

  factory PatientCardType.fromMap(Map<String, dynamic> json) {
    return PatientCardType(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && other is PatientCardType && id == other.id;

  @override
  int get hashCode => super.hashCode;
}
