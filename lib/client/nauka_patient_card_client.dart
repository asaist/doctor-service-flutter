import 'dart:convert';

import 'package:doctor_service_flutter/model/blank.dart';
import 'package:doctor_service_flutter/model/patient.dart';
import 'package:doctor_service_flutter/model/patient_card.dart';
import 'package:doctor_service_flutter/model/patient_card_type.dart';
import 'package:doctor_service_flutter/model/service.dart';
import 'package:doctor_service_flutter/model/sex.dart';
import 'package:doctor_service_flutter/widgets/dialogs/controller/dialog_controllers.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_blank.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_service.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NaukaPatientCardClient {
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');

  static Future<PatientDetail> create(PatientDetail patientDetail) async {
    final response = await http.post(
      Uri.parse('http://172.16.0.251:8081/api/patient/patient-create'),
      headers: {
        'Access-Control-Allow-Origin': '172.16.0.251',
        "content-type": "application/json",
      },
      body: jsonEncode(
        <String, dynamic>{
          'id': patientDetail.id,
          'name': patientDetail.name,
          'surname': patientDetail.surname,
          'sex_id': patientDetail.sexId,
          'sex_name': patientDetail.sexName,
          'patronymic': patientDetail.patronymic,
          'date_of_birth': patientDetail.dateOfBirth,
          'phone': patientDetail.phone,
          'anonymous': patientDetail.anonymous,
          'comment': patientDetail.comment,
          'email': patientDetail.email,
          'inn': patientDetail.inn,
          'workplace': patientDetail.workplace,
          'profession': patientDetail.profession,
          'work_experience': patientDetail.workExperience,
          'place_of_birth': patientDetail.placeOfBirth,
          'passport_code': patientDetail.passportCode,
          'passport_series': patientDetail.passportSeries,
          'passport_number': patientDetail.passportNumber,
          'passport_issued_by': patientDetail.passportIssuedBy,
          'passport_issuing_date': patientDetail.passportIssuingDate,
          'address_of_residence': patientDetail.addressOfResidence,
          'passport_address_of_residence':
              patientDetail.passportAddressOfResidence,
          'international_name': patientDetail.internationalName,
          'international_surname': patientDetail.internationalSurname,
          'international_passport_number':
              patientDetail.internationalPassportNumber,
          'guardian_id': patientDetail.guardianId,
          'guardian_name': patientDetail.guardianName,
          'guardian_surname': patientDetail.guardianSurname,
          'guardian_patronymic': patientDetail.guardianPatronymic,
          'birth_certificate_series': patientDetail.birthCertificateSeries,
          'birth_certificate_number': patientDetail.birthCertificateNumber,
          'birth_certificate_issuing_date':
              patientDetail.birthCertificateIssuingDate,
          'birth_certificate_issued_by': patientDetail.birthCertificateIssuedBy,
          'policy_series': patientDetail.policySeries,
          'policy_number': patientDetail.policyNumber,
          'policy_issued_date': patientDetail.passportIssuingDate,
        },
      ),
    );
    if (response.statusCode == 201) {
      return PatientDetail.fromMap(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(
          'Ошибка сохранения информации о пациенте ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<PatientDetail> update(PatientDetail patientDetail) async {
    final response = await http.put(
      Uri.parse('http://172.16.0.251:8081/api/patient/patient-update'),
      headers: {
        'Access-Control-Allow-Origin': '172.16.0.251',
        "content-type": "application/json",
      },
      body: jsonEncode(
        <String, dynamic>{
          'id': patientDetail.id,
          'name': patientDetail.name,
          'surname': patientDetail.surname,
          'sex_id': patientDetail.sexId,
          'sex_name': patientDetail.sexName,
          'patronymic': patientDetail.patronymic,
          'date_of_birth': patientDetail.dateOfBirth,
          'phone': patientDetail.phone,
          'anonymous': patientDetail.anonymous,
          'comment': patientDetail.comment,
          'email': patientDetail.email,
          'inn': patientDetail.inn,
          'workplace': patientDetail.workplace,
          'profession': patientDetail.profession,
          'work_experience': patientDetail.workExperience,
          'place_of_birth': patientDetail.placeOfBirth,
          'passport_code': patientDetail.passportCode,
          'passport_series': patientDetail.passportSeries,
          'passport_number': patientDetail.passportNumber,
          'passport_issued_by': patientDetail.passportIssuedBy,
          'passport_issuing_date': patientDetail.passportIssuingDate,
          'address_of_residence': patientDetail.addressOfResidence,
          'passport_address_of_residence':
              patientDetail.passportAddressOfResidence,
          'international_name': patientDetail.internationalName,
          'international_surname': patientDetail.internationalSurname,
          'international_passport_number':
              patientDetail.internationalPassportNumber,
          'guardian_id': patientDetail.guardianId,
          'guardian_name': patientDetail.guardianName,
          'guardian_surname': patientDetail.guardianSurname,
          'guardian_patronymic': patientDetail.guardianPatronymic,
          'birth_certificate_series': patientDetail.birthCertificateSeries,
          'birth_certificate_number': patientDetail.birthCertificateNumber,
          'birth_certificate_issuing_date':
              patientDetail.birthCertificateIssuingDate,
          'birth_certificate_issued_by': patientDetail.birthCertificateIssuedBy,
          'policy_series': patientDetail.policySeries,
          'policy_number': patientDetail.policyNumber,
          'policy_issued_date': patientDetail.passportIssuingDate,
        },
      ),
    );
    if (response.statusCode == 200) {
      return PatientDetail.fromMap(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(
          'Ошибка сохранения информации о пациенте ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<PatientDetail> createPatientCard(
      int? patientId, int? cardTypeId) async {
    final response = await http.post(
      Uri.parse('http://172.16.0.251:8081/api/patient-card/create'),
      headers: {
        'Access-Control-Allow-Origin': '172.16.0.251',
        "content-type": "application/json",
      },
      body: jsonEncode(
        <String, dynamic>{
          'patient_id': patientId,
          'card_type_id': cardTypeId,
        },
      ),
    );
    if (response.statusCode == 201) {
      return PatientDetail.fromMap(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(
          'Ошибка создания карты ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<PatientCardType>> getPatientCardTypes() async {
    final response = await http.get(
        Uri.parse(
            'http://172.16.0.251:8081/api/patient-card-type/patient-card-types'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<PatientCardType>.from(
        list.map(
          (model) => PatientCardType.fromMap(model),
        ),
      );
    } else {
      throw Exception(
          'Ошибка загрузки типов карты ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Service>> getServices(
      SelectedBlank selectedBlank, SelectedService service) async {
    if (selectedBlank.blank?.id == null) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => service.services,
      );
    }

    final response = await http.get(
        Uri.parse(
            'http://172.16.0.251:8081/api/service/service-by-blank/${selectedBlank.blank!.id}'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Service>.from(
        list.map(
          (model) => Service.fromMap(model),
        ),
      );
    } else {
      throw Exception(
          'Ошибка загрузки типов карты ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<PatientDetail> getPatientDetail(int? id) async {
    if (id == null) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => PatientDetail(),
      );
    }

    final response = await http.get(
        Uri.parse('http://172.16.0.251:8081/api/patient/patient/$id'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      return PatientDetail.fromMap(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(
          'Ошибка загрузки информации о пациенте ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Patient>> getPatients() async {
    final queryParameters = {
      'surname': DialogController.findSurnameController.text,
      'name': DialogController.findNameController.text,
      'patronymic': DialogController.findPatronymicController.text,
      'phone': DialogController.findPhoneFindController.text,
    };

    final response = await http.get(
        Uri.http('172.16.0.251:8081', '/api/patient/patients-by-fio-and-phone',
            queryParameters),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Patient>.from(
        list.map(
          (model) => Patient.fromMap(model),
        ),
      );
    } else {
      throw Exception(
          'Ошибка загрузки пациентов ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<PatientCard>> getCards(
      SelectedPatient selectedPatient) async {
    if (selectedPatient.patient?.id == null) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => [PatientCard()],
      );
    }

    final response = await http.get(
        Uri.parse(
            'http://172.16.0.251:8081/api/patient-card/patient-cards/${selectedPatient.patient?.id}'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<PatientCard>.from(
        list.map(
          (model) => PatientCard.fromMap(model),
        ),
      );
    } else {
      throw Exception(
          'Ошибка загрузки информации о пациенте ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Blank>> getBlanks(int? id) async {
    if (id == null) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => [
          Blank(),
        ],
      );
    }

    final response = await http.get(
        Uri.parse(
          'http://172.16.0.251:8081/api/blank/blank-by-patient-card/$id',
        ),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Blank>.from(
        list.map(
          (model) => Blank.fromMap(model),
        ),
      );
    } else {
      throw Exception(
          'Ошибка загрузки информации о пациенте ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Sex>> getSexes() async {
    final response = await http.get(
        Uri.parse('http://172.16.0.251:8081/api/sexes/sexes'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Sex>.from(list.map((model) => Sex.fromMap(model)));
    } else {
      throw Exception(
          'Ошибка загрузки врачей ${utf8.decode(response.bodyBytes)}');
    }
  }
}
