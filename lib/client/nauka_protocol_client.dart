import 'dart:convert';

import 'package:doctor_service_flutter/model/blank.dart';
import 'package:doctor_service_flutter/model/clinic.dart';
import 'package:doctor_service_flutter/model/protocol_field.dart';
import 'package:doctor_service_flutter/model/service.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_blank.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_service.dart';
import 'package:doctor_service_flutter/widgets/protocol/data/selected_clinic.dart';
import 'package:doctor_service_flutter/widgets/selected_worker.dart';
import 'package:http/http.dart' as http;

class NaukaProtocolClient {
  static Future<List<ProtocolField>> getProtocolFields(
      SelectedBlank blank, Service service) async {
    if (service.id == null || blank.blank?.id == null) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => [],
      );
    }

    final Map<String, dynamic> queryParameters = {
      'blank_id': blank.blank?.id.toString(),
      'service_id': service.id.toString(),
    };
    var uri = Uri.http('172.16.0.251:8081',
        '/api/protocol/protocols-by-blank-and-service', queryParameters);

    final response = await http
        .get(uri, headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<ProtocolField>.from(
          list.map((model) => ProtocolField.fromMap(model)));
    } else {
      throw Exception(
          'Ошибка загрузки протокола ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Clinic>> getClinicsWithFilial() async {
    final response = await http.get(
        Uri.parse('http://172.16.0.251:8081/api/clinic/clinics-with-filial'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Clinic>.from(list.map((model) => Clinic.fromMap(model)));
    } else {
      throw Exception(
          'Ошибка загрузки клиник ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Service>> getServiceByFilial(SelectedClinic clinic) async {
    if (clinic.clinic.id == null) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => [],
      );
    }

    final response = await http.get(
        Uri.parse(
            'http://172.16.0.251:8081/api/service/service-by-filial/${clinic.clinic.filialId}'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Service>.from(list.map((model) => Service.fromMap(model)));
    } else {
      throw Exception(
          'Ошибка загрузки услуг ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Service>> getServiceByDoctor(SelectedWorker doctor) async {
    if (doctor.id == 0) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => [],
      );
    }

    final response = await http.get(
        Uri.parse(
            'http://172.16.0.251:8081/api/service/service-by-doctor-and-filial/${doctor.id}'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Service>.from(list.map((model) => Service.fromMap(model)));
    } else {
      throw Exception(
          'Ошибка загрузки услуг ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<String> addServiceToBlank(int? patientId, int? patientCardId,
      int? doctorId, SelectedBlank blank, SelectedService service) async {
    if (blank.blank?.id == null || service.services.isEmpty) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => '',
      );
    }

    final Map<String, dynamic> queryParameters = {
      'blank_id': blank.blank?.id.toString()
    };
    var uri = Uri.http(
        '172.16.0.251:8081', '/api/blank/add-services', queryParameters);

    final response = await http.post(
      uri,
      headers: {
        'Access-Control-Allow-Origin': '172.16.0.251',
        "content-type": "application/json",
      },
      body: jsonEncode(
        <String, dynamic>{
          'id': blank.blank?.id,
          'doctor_id': doctorId,
          'patient_id': patientId,
          'patient_card_id': patientCardId,
          'services': service.services.map((e) => e.toJson()).toList(),
        },
      ),
    );
    if (response.statusCode == 200) {
      blank.lastUpdateTime = DateTime.now();
      return 'Услуги успешно добавлены';
    } else {
      throw Exception(
          'Ошибка добавления услуг ${utf8.decode(response.bodyBytes)}');
    }
  }

  static void updateProtocol(
      SelectedBlank blank, List<ProtocolField> protocolFields) async {
    var uri = Uri.http('172.16.0.251:8081', '/api/protocol/update');

    final response = await http.put(
      uri,
      headers: {
        'Access-Control-Allow-Origin': '172.16.0.251',
        "content-type": "application/json",
      },
      body: jsonEncode(protocolFields),
    );
    if (response.statusCode == 200) {
      blank.lastUpdateTime = DateTime.now();
    } else {
      throw Exception(
          'Ошибка добавления услуг ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<Blank> createBlank(int? patientId, int? patientCardId,
      int? doctorId, List<Service> services) async {
    if (patientId == null ||
        patientCardId == null ||
        doctorId == null ||
        services.isEmpty) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => Blank(),
      );
    }
    final response = await http.post(
      Uri.parse('http://172.16.0.251:8081/api/blank/create'),
      headers: {
        'Access-Control-Allow-Origin': '172.16.0.251',
        "content-type": "application/json",
      },
      body: jsonEncode(
        <String, dynamic>{
          'doctor_id': doctorId,
          'patient_id': patientId,
          'patient_card_id': patientCardId,
          'services': services.map((e) => e.toJson()).toList(),
        },
      ),
    );
    if (response.statusCode == 201) {
      return Blank.fromMap(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(
          'Ошибка создания бланка ${utf8.decode(response.bodyBytes)}');
    }
  }
}
