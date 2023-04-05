import 'package:doctor_service_flutter/model/patient_card_type.dart';
import 'package:flutter/material.dart';

class SelectedPatientCardType extends ChangeNotifier {
  PatientCardType _patientCardType =
      const PatientCardType(id: null, name: null);

  DateTime? _lastUpdateTime;

  DateTime? get lastUpdateTime => _lastUpdateTime;

  set lastUpdateTime(DateTime? value) {
    _lastUpdateTime = value;
  }

  PatientCardType get patientCardType => _patientCardType;

  set patientCardType(PatientCardType patient) {
    _patientCardType = patient;
    notifyListeners();
  }
}
