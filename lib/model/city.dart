import 'dart:convert';

import 'clinic.dart';

class City {
  final int id;
  final String name;

  const City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CityDetail {
  final int id;
  final String name;
  final List<ClinicDetail> clinics;

  const CityDetail(
      {required this.id, required this.name, required this.clinics});

  factory CityDetail.fromJson(String str) =>
      CityDetail.fromJson(json.decode(str));

  factory CityDetail.fromMap(Map<String, dynamic> json) {
    List<ClinicDetail> clinics = [];

    var city = CityDetail(
      id: json['id'],
      name: json['name'],
      clinics: clinics,
    );
    json['clinics'].forEach((value) {
      clinics.add(ClinicDetail.fromMap(value));
    });
    return city;}
}
