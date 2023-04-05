import 'package:flutter/material.dart';

class ScheduleSharedData extends ChangeNotifier {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  String? _doctorId;
  String? _clinicId;

  DateTime? _lastUpdateTime;

  DateTime get focusedDay => _focusedDay;

  set focusedDay(DateTime focusedDay) {
    _focusedDay = focusedDay;
    notifyListeners();
  }

  DateTime? get selectedDay => _selectedDay;

  set selectedDay(DateTime? selectedDay) {
    _selectedDay = selectedDay;
    notifyListeners();
  }

  DateTime? get rangeStart => _rangeStart;

  set rangeStart(DateTime? rangeStart) {
    _rangeStart = rangeStart;
    notifyListeners();
  }

  DateTime? get rangeEnd => _rangeEnd;

  set rangeEnd(DateTime? rangeEnd) {
    _rangeEnd = rangeEnd;
    notifyListeners();
  }

  String? get doctorId => _doctorId;

  set doctorId(String? doctorId) {
    _doctorId = doctorId;
    notifyListeners();
  }

  String? get clinicId => _clinicId;

  set clinicId(String? clinicId) {
    _clinicId = clinicId;
    notifyListeners();
  }

  DateTime? get lastUpdateTime => _lastUpdateTime;

  set lastUpdateTime(DateTime? lastUpdateTime) {
    _lastUpdateTime = lastUpdateTime;
    notifyListeners();
  }
}
