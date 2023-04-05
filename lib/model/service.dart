import 'dart:convert';

class Service {
  int? id;
  int? doctorId;
  String? doctorFio;
  String? serviceCode;
  String? serviceName;

  Service(
      {this.id,
      this.doctorId,
      this.doctorFio,
      this.serviceCode,
      this.serviceName});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "doctor_id": doctorId,
      "doctor_fio": doctorFio,
      "service_name": serviceName,
      "service_code": serviceCode,
    };
  }

  factory Service.fromJson(String str) => Service.fromMap(json.decode(str));

  factory Service.fromMap(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      doctorId: json['doctor_id'],
      doctorFio: json['doctor_fio'],
      serviceCode: json['service_code'],
      serviceName: json['service_name'],
    );
  }

  @override
  bool operator ==(dynamic other) =>
      other != null && other is Service && id == other.id;

  @override
  int get hashCode => super.hashCode;
}
