import 'dart:convert';

class Doctor {
  final int id;
  final String fio;

  const Doctor({required this.id, required this.fio});

  factory Doctor.fromJson(String str) => Doctor.fromMap(json.decode(str));

  factory Doctor.fromMap(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      fio: json['fio'],
    );
  }
}
