import 'dart:convert';

import 'package:doctor_service_flutter/model/specialization.dart';

class Clinic {
  final int? id;
  final String? name;
  final int? filialId;
  final String? filialName;

  const Clinic({this.id, this.name, this.filialId, this.filialName});

  factory Clinic.fromJson(String str) => Clinic.fromMap(json.decode(str));

  factory Clinic.fromMap(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      name: json['name'],
      filialId: json['filial_id'],
      filialName: json['filial_name'],
    );
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && other is Clinic && filialId == other.filialId && id == other.id;

  @override
  int get hashCode => super.hashCode;
}

class ClinicDetail {
  final int id;
  final String name;
  final List<SpecializationDetail> specializations;

  const ClinicDetail(
      {required this.id, required this.name, required this.specializations});

  factory ClinicDetail.fromJson(String str) =>
      ClinicDetail.fromJson(json.decode(str));

  factory ClinicDetail.fromMap(Map<String, dynamic> json) {
    List<SpecializationDetail> specializations = [];

    var clinic = ClinicDetail(
      id: json['id'],
      name: json['name'],
      specializations: specializations,
    );
    json['specializations'].forEach((value) {
      specializations.add(SpecializationDetail.fromMap(value));
    });
    return clinic;
  }
}
