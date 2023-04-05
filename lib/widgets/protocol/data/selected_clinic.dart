import 'package:doctor_service_flutter/model/clinic.dart';
import 'package:flutter/material.dart';

class SelectedClinic extends ChangeNotifier {
  Clinic _clinic = const Clinic(id: null, name: null);

  DateTime? _lastUpdateTime;

  DateTime? get lastUpdateTime => _lastUpdateTime;

  set lastUpdateTime(DateTime? value) {
    _lastUpdateTime = value;
    notifyListeners();
  }

  Clinic get clinic => _clinic;

  set clinic(Clinic clinic) {
    _clinic = clinic;
    notifyListeners();
  }
}
