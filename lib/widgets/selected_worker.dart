import 'package:doctor_service_flutter/model/blank.dart';
import 'package:flutter/material.dart';

class SelectedWorker extends ChangeNotifier {
  int _id = 0;

  int get id => _id;

  set id(int id) {
    _id = id;
    notifyListeners();
  }

  DateTime? _lastUpdateTime;

  DateTime? get lastUpdateTime => _lastUpdateTime;

  set lastUpdateTime(DateTime? value) {
    _lastUpdateTime = value;
    notifyListeners();
  }
}
