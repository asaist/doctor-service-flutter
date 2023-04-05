import 'package:doctor_service_flutter/model/patient.dart';
import 'package:flutter/material.dart';

class SelectedPatient extends ChangeNotifier {
  PatientDetail? _patient;

  DateTime? _lastUpdateTime;

  DateTime? get lastUpdateTime => _lastUpdateTime;

  set lastUpdateTime(DateTime? value) {
    _lastUpdateTime = value;
    notifyListeners();
  }

  PatientDetail? get patient => _patient;

  set patient(PatientDetail? patient) {
    _patient = patient;
    notifyListeners();
  }
}
