import 'package:doctor_service_flutter/model/service.dart';
import 'package:flutter/material.dart';

class SelectedService extends ChangeNotifier {
  Service _service = Service();

  Service get service => _service;

  set service(Service service) {
    _service = service;
    notifyListeners();
  }

  List<Service> _services = [];

  List<Service> get services => _services;

  set services(List<Service> services) {
    _services = services;
    notifyListeners();
  }

  DateTime? _lastUpdateTime;

  DateTime? get lastUpdateTime => _lastUpdateTime;

  set lastUpdateTime(DateTime? value) {
    _lastUpdateTime = value;
    notifyListeners();
  }
}
