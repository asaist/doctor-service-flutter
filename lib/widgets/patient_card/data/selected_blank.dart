import 'package:doctor_service_flutter/model/blank.dart';
import 'package:flutter/material.dart';

class SelectedBlank extends ChangeNotifier {
  Blank? _blank = Blank();

  Blank? get blank => _blank;

  set blank(Blank? blank) {
    _blank = blank;
    notifyListeners();
  }

  DateTime? _lastUpdateTime;

  DateTime? get lastUpdateTime => _lastUpdateTime;

  set lastUpdateTime(DateTime? value) {
    _lastUpdateTime = value;
    notifyListeners();
  }
}
