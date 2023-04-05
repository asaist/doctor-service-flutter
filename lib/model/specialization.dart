import 'dart:convert';

import 'doctor.dart';

class Specialization {
  final int id;
  final String name;

  const Specialization({required this.id, required this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      name: json['name'],
    );
  }
}

class SpecializationDetail {
  final int id;
  final String name;
  final List<Doctor> doctors;

  const SpecializationDetail(
      {required this.id, required this.name, required this.doctors});

  factory SpecializationDetail.fromJson(String str) =>
      SpecializationDetail.fromJson(json.decode(str));

  factory SpecializationDetail.fromMap(Map<String, dynamic> json) {
    List<Doctor> doctors = [];

    var clinic = SpecializationDetail(
      id: json['id'],
      name: json['name'],
      doctors: doctors,
    );
    json['doctors'].forEach((value) {
      doctors.add(Doctor.fromMap(value));
    });
    return clinic;
  }
}
