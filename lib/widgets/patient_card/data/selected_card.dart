import 'package:doctor_service_flutter/model/patient_card.dart';
import 'package:flutter/material.dart';

class SelectedCard extends ChangeNotifier {
  PatientCard? _patientCard;

  PatientCard? get patientCard => _patientCard;

  set patientCard(PatientCard? patientCard) {
    _patientCard = patientCard;
    notifyListeners();
  }
}
