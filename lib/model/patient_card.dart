import 'dart:convert';

class PatientCard {
  int? id;
  String? endDate;
  String? startDate;
  bool? isDeleted;
  String? cardNumber;
  int? cardTypeId;
  String? cardTypeName;

  PatientCard(
      {this.id,
      this.endDate,
      this.startDate,
      this.isDeleted,
      this.cardNumber,
      this.cardTypeId,
      this.cardTypeName});

  factory PatientCard.fromJson(String str) =>
      PatientCard.fromMap(json.decode(str));

  factory PatientCard.fromMap(Map<String, dynamic> json) {
    return PatientCard(
      id: json['id'],
      endDate: json['end_date'],
      startDate: json['start_date'],
      cardNumber: json['card_number'],
      cardTypeId: json['card_type_id'],
      cardTypeName: json['card_type_name'],
      isDeleted: json['is_deleted'],
    );
  }
}
