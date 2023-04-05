import 'package:doctor_service_flutter/model/schedule.dart';
import 'package:flutter/material.dart';

class SelectedSchedule extends ChangeNotifier {
  Schedule? _schedule;

  Schedule? get schedule => _schedule;

  set schedule(Schedule? schedule) {
    _schedule = schedule;
    notifyListeners();
  }
}
