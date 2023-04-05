import 'dart:convert';

import 'package:doctor_service_flutter/model/city.dart';
import 'package:doctor_service_flutter/model/schedule.dart';
import 'package:doctor_service_flutter/model/status.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/schedule_shared_data.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/selected_schedule.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NaukaScheduleClient {
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');

  static Future<List<CityDetail>> getDoctors() async {
    final response = await http.get(
        Uri.parse('http://172.16.0.251:8081/api/doctor/doctors-tree'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<CityDetail>.from(
          list.map((model) => CityDetail.fromMap(model)));
    } else {
      throw Exception(
          'Ошибка загрузки врачей ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Status>> getStatuses() async {
    final response = await http.get(
        Uri.parse('http://172.16.0.251:8081/api/status/statuses'),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Status>.from(list.map((model) => Status.fromMap(model)));
    } else {
      throw Exception(
          'Ошибка загрузки врачей ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<List<Schedule>> getSchedule(
      ScheduleSharedData sharedData) async {
    if (sharedData.doctorId == null || sharedData.clinicId == null) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => [],
      );
    }

    DateTime? startDate = sharedData.rangeStart ??
        (sharedData.selectedDay ?? sharedData.focusedDay);
    DateTime? endDate = sharedData.rangeEnd ??
        (sharedData.selectedDay ?? sharedData.focusedDay);

    final queryParameters = {
      'doctor': sharedData.doctorId,
      'clinic': sharedData.clinicId,
      'start-date': formatter.format(startDate),
      'end-date': formatter.format(endDate),
    };

    final response = await http.get(
        Uri.http('172.16.0.251:8081', '/api/schedule/doctor-schedule',
            queryParameters),
        headers: {'Access-Control-Allow-Origin': '172.16.0.251'});
    if (response.statusCode == 200) {
      Iterable list = json.decode(utf8.decode(response.bodyBytes));
      return List<Schedule>.from(list.map((model) => Schedule.fromMap(model)));
    } else {
      throw Exception(
          'Ошибка загрузки расписания ${utf8.decode(response.bodyBytes)}');
    }
  }

  static Future<Schedule?> updateSchedule(
      ScheduleSharedData sharedData, SelectedSchedule selectedSchedule) async {
    Schedule? schedule = selectedSchedule.schedule;
    if (schedule == null) {
      return Future.delayed(
        const Duration(seconds: 1),
        () => null,
      );
    }

    final response = await http.put(
      Uri.parse('http://172.16.0.251:8081/api/schedule/update'),
      headers: {
        'Access-Control-Allow-Origin': '172.16.0.251',
        "content-type": "application/json",
      },
      body: jsonEncode(
        <String, dynamic>{
          'id': schedule.id,
          'comment': schedule.comment,
          'status_id': schedule.statusId,
          'patient_id': schedule.patientId,
          'patient_fio': schedule.patientFio,
          'patient_phone': schedule.patientPhone,
          'patient_birth_date': schedule.patientBirthDate,
        },
      ),
    );
    if (response.statusCode == 200) {
      sharedData.lastUpdateTime = DateTime.now();
      return Schedule.fromMap(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(
          'Ошибка обновлении записи на прием ${utf8.decode(response.bodyBytes)}');
    }
  }
}
