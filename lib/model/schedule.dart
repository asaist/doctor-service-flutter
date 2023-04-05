import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Schedule {
  int id;
  DateTime date;
  int timeId;
  int statusId;
  int doctorId;
  String? comment;
  int? patientId;
  String timeName;
  String? doctorFio;
  String? patientFio;
  String statusName;
  bool? isReminded;
  String? patientPhone;
  String? patientBirthDate;
  bool? isPatientCardAvailable;

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

  Schedule(
      this.id,
      this.date,
      this.timeId,
      this.statusId,
      this.doctorId,
      this.comment,
      this.patientId,
      this.timeName,
      this.doctorFio,
      this.patientFio,
      this.statusName,
      this.isReminded,
      this.patientPhone,
      this.patientBirthDate,
      this.isPatientCardAvailable,
      this.eventName,
      this.from,
      this.to,
      this.background,
      this.isAllDay);

  factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

  factory Schedule.fromMap(Map<String, dynamic> json) {
    return Schedule(
      json['id'],
      DateTime.parse(json['date']),
      json['time_id'],
      json['status_id'],
      json['doctor_id'],
      json['comment'] ?? '',
      json['patient_id'],
      json['time_name'],
      json['doctor_fio'],
      json['patient_fio'],
      json['status_name'],
      json['is_reminded'],
      json['patient_phone'],
      json['patient_birth_date'],
      json['is_patient_card_available'],
      json['patient_fio'] ?? '',
      DateTime.parse('${json['date']} ${json['time_name']}'),
      DateTime.parse('${json['date']} ${json['time_name']}')
          .add(const Duration(minutes: 15)),
      json['status_name'] == 'Доступен'
          ? Colors.green.withOpacity(0.7)
          : json['status_name'] == 'Записан'
              ? Colors.redAccent.withOpacity(0.7)
              : json['status_name'] == 'Предварительная запись'
                  ? Colors.grey.withOpacity(0.7)
                  : Colors.amberAccent.withOpacity(0.7),
      false,
    );
  }
}

class ScheduleDataSource extends CalendarDataSource {
  ScheduleDataSource(List<Schedule> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
