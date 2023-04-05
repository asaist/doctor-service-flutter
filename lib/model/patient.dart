import 'dart:convert';

class Patient {
  final int id;
  final String phone;
  final String name;
  final String surname;
  final String patronymic;
  final String dateOfBirth;

  const Patient({
    required this.id,
    required this.phone,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.dateOfBirth,
  });

  factory Patient.fromJson(String str) => Patient.fromMap(json.decode(str));

  factory Patient.fromMap(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      phone: json['phone'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      patronymic: json['patronymic'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
    );
  }
}

class PatientDetail {
  int? id;
  bool? anonymous;
  int? sexId;
  String? sexName;
  String? name;
  String? surname;
  String? patronymic;
  String? dateOfBirth;
  String? comment;
  String? email;
  String? phone;
  String? inn;
  String? workplace;
  String? profession;
  String? workExperience;
  String? placeOfBirth;
  String? passportCode;
  String? passportSeries;
  String? passportNumber;
  String? passportIssuedBy;
  String? passportIssuingDate;
  String? addressOfResidence;
  String? passportAddressOfResidence;
  String? internationalName;
  String? internationalSurname;
  String? internationalPassportNumber;
  int? guardianId;
  String? guardianName;
  String? guardianSurname;
  String? guardianPatronymic;
  String? birthCertificateSeries;
  String? birthCertificateNumber;
  String? birthCertificateIssuingDate;
  String? birthCertificateIssuedBy;
  String? policySeries;
  String? policyNumber;
  String? policyIssuedDate;
  DateTime? lastUpdateTime;

  PatientDetail({
    this.id,
    this.name,
    this.surname,
    this.sexId,
    this.sexName,
    this.patronymic,
    this.dateOfBirth,
    this.phone,
    this.anonymous,
    this.comment,
    this.email,
    this.inn,
    this.workplace,
    this.profession,
    this.workExperience,
    this.placeOfBirth,
    this.passportCode,
    this.passportSeries,
    this.passportNumber,
    this.passportIssuedBy,
    this.passportIssuingDate,
    this.addressOfResidence,
    this.passportAddressOfResidence,
    this.internationalName,
    this.internationalSurname,
    this.internationalPassportNumber,
    this.guardianId,
    this.guardianName,
    this.guardianSurname,
    this.guardianPatronymic,
    this.birthCertificateSeries,
    this.birthCertificateNumber,
    this.birthCertificateIssuingDate,
    this.birthCertificateIssuedBy,
    this.policySeries,
    this.policyNumber,
    this.policyIssuedDate,
  });

  factory PatientDetail.fromJson(String str) =>
      PatientDetail.fromMap(json.decode(str));

  factory PatientDetail.fromMap(Map<String, dynamic> json) {
    return PatientDetail(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      sexId: json['sex_id'],
      sexName: json['sex_name'],
      patronymic: json['patronymic'],
      dateOfBirth: json['date_of_birth'],
      phone: json['phone'],
      anonymous: json['anonymous'],
      comment: json['comment'],
      email: json['email'],
      inn: json['inn'],
      workplace: json['workplace'],
      profession: json['profession'],
      workExperience: json['work_experience'],
      placeOfBirth: json['place_of_birth'],
      passportCode: json['passport_code'],
      passportSeries: json['passport_series'],
      passportNumber: json['passport_number'],
      passportIssuedBy: json['passport_issued_by'],
      passportIssuingDate: json['passport_issuing_date'],
      addressOfResidence: json['address_of_residence'],
      passportAddressOfResidence: json['passport_address_of_residence'],
      internationalName: json['international_name'],
      internationalSurname: json['international_surname'],
      internationalPassportNumber: json['international_passport_number'],
      guardianId: json['guardian_id'],
      guardianName: json['guardian_name'],
      guardianSurname: json['guardian_surname'],
      guardianPatronymic: json['guardian_patronymic'],
      birthCertificateSeries: json['birth_certificate_series'],
      birthCertificateNumber: json['birth_certificate_number'],
      birthCertificateIssuingDate: json['birth_certificate_issuing_date'],
      birthCertificateIssuedBy: json['birth_certificate_issued_by'],
      policySeries: json['policy_series'],
      policyNumber: json['policy_number'],
      policyIssuedDate: json['policy_issued_date'],
    );
  }
}
