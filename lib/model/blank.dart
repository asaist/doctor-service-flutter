import 'dart:convert';

import 'package:doctor_service_flutter/model/service.dart';

class Blank {
  int? id;
  String? date;
  int? number;
  int? doctorId;
  String? doctorFio;
  String? filialCode;
  int? serviceId;
  List<Service>? services;

  Blank({
    this.id,
    this.date,
    this.number,
    this.doctorId,
    this.doctorFio,
    this.filialCode,
    this.serviceId,
    this.services,
  });

  factory Blank.fromJson(String str) => Blank.fromMap(json.decode(str));

  factory Blank.fromMap(Map<String, dynamic> json) {
    List<Service>? services;
    if (json['services'] != null) {
      services = List<Service>.from(
          json['services'].map((model) => Service.fromMap(model)));
    }

    return Blank(
      id: json['id'],
      date: json['date'],
      number: json['number'],
      doctorId: json['doctor_id'],
      doctorFio: json['doctor_fio'],
      filialCode: json['filial_code'],
      serviceId: json['service_id'],
      services: services,
    );
  }
}
