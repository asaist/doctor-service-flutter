import 'package:doctor_service_flutter/client/nauka_patient_card_client.dart';
import 'package:doctor_service_flutter/model/patient.dart';
import 'package:doctor_service_flutter/model/sex.dart';
import 'package:doctor_service_flutter/style/custom_outline_input_border.dart';
import 'package:doctor_service_flutter/style/custom_text_style.dart';
import 'package:doctor_service_flutter/widgets/dialogs/controller/dialog_controllers.dart';
import 'package:doctor_service_flutter/widgets/dialogs/find_patient_dialog_patient_card.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_card.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/patient_card_controllers.dart';

class PatientDetailsWidget extends StatefulWidget {
  const PatientDetailsWidget({super.key});

  @override
  PatientDetailsWidgetState createState() => PatientDetailsWidgetState();
}

class PatientDetailsWidgetState extends State<PatientDetailsWidget> {
  Sex? selectedSex;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PatientDetail>(
      future: NaukaPatientCardClient.getPatientDetail(
          context.watch<SelectedPatient>().patient?.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var detail = snapshot.data!;

          PatientCardController.passportSeriesController.text =
              detail.passportSeries ?? '';

          PatientCardController.passportNumberController.text =
              detail.passportNumber ?? '';

          PatientCardController.passportIssuedByController.text =
              detail.passportIssuedBy ?? '';

          PatientCardController.passportIssuingDateController.text =
              detail.passportIssuingDate ?? '';

          PatientCardController.addressOfResidenceController.text =
              detail.addressOfResidence ?? '';

          PatientCardController.passportAddressOfResidenceController.text =
              detail.passportAddressOfResidence ?? '';

          PatientCardController.internationalNameController.text =
              detail.internationalName ?? '';

          PatientCardController.internationalSurnameController.text =
              detail.internationalSurname ?? '';

          PatientCardController.internationalPassportNumberController.text =
              detail.internationalPassportNumber ?? '';

          PatientCardController.guardianNameController.text =
              detail.guardianName ?? '';

          PatientCardController.guardianSurnameController.text =
              detail.guardianSurname ?? '';

          PatientCardController.guardianPatronymicController.text =
              detail.guardianPatronymic ?? '';

          PatientCardController.birthCertificateSeriesController.text =
              detail.birthCertificateSeries ?? '';

          PatientCardController.birthCertificateNumberController.text =
              detail.birthCertificateNumber ?? '';

          PatientCardController.birthCertificateIssuingDateController.text =
              detail.birthCertificateIssuingDate ?? '';

          PatientCardController.birthCertificateIssuedByController.text =
              detail.birthCertificateIssuedBy ?? '';

          PatientCardController.policySeriesController.text =
              detail.policySeries ?? '';

          PatientCardController.policyNumberController.text =
              detail.policyNumber ?? '';

          PatientCardController.policyIssuedDateController.text =
              detail.policyIssuedDate ?? '';

          PatientCardController.sexNameController.text = detail.sexName ?? '';

          PatientCardController.nameController.text = detail.name ?? context.read<SelectedPatient>().patient?.name ?? '';

          PatientCardController.surnameController.text = detail.surname ?? context.read<SelectedPatient>().patient?.surname ?? '';

          PatientCardController.patronymicController.text =
              detail.patronymic ?? context.read<SelectedPatient>().patient?.patronymic ?? '';

          PatientCardController.dateOfBirthController.text =
              detail.dateOfBirth ?? context.read<SelectedPatient>().patient?.dateOfBirth ?? '';

          PatientCardController.commentController.text = detail.comment ?? context.read<SelectedPatient>().patient?.comment ?? '';

          PatientCardController.innController.text = detail.inn ?? '';

          PatientCardController.emailController.text = detail.email ?? '';

          PatientCardController.phoneController.text = detail.phone ?? context.read<SelectedPatient>().patient?.phone ?? '';

          PatientCardController.workplaceController.text =
              detail.workplace ?? '';

          PatientCardController.professionController.text =
              detail.profession ?? '';

          PatientCardController.workExperienceController.text =
              detail.workExperience ?? '';

          PatientCardController.placeOfBirthController.text =
              detail.placeOfBirth ?? '';

          PatientCardController.passportCodeController.text =
              detail.passportCode ?? '';

          selectedSex = Sex(id: detail.sexId, name: detail.sexName);

          return Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            color: Colors.white12,
            child: ListView(
              children: [
                Card(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            tooltip: 'Сохранить',
                            onPressed: () {
                              PatientDetail patientDetail = PatientDetail();

                              patientDetail.id = detail.id;
                              patientDetail.sexId = selectedSex?.id;
                              patientDetail.passportSeries =
                                  PatientCardController
                                      .passportSeriesController.text;
                              patientDetail.passportNumber =
                                  PatientCardController
                                      .passportNumberController.text;
                              patientDetail.passportIssuedBy =
                                  PatientCardController
                                      .passportIssuedByController.text;
                              patientDetail.passportIssuingDate =
                                  PatientCardController
                                      .passportIssuingDateController.text;
                              patientDetail.addressOfResidence =
                                  PatientCardController
                                      .addressOfResidenceController.text;
                              patientDetail.passportAddressOfResidence =
                                  PatientCardController
                                      .passportAddressOfResidenceController
                                      .text;
                              patientDetail.internationalName =
                                  PatientCardController
                                      .internationalNameController.text;
                              patientDetail.internationalSurname =
                                  PatientCardController
                                      .internationalSurnameController.text;
                              patientDetail.internationalPassportNumber =
                                  PatientCardController
                                      .internationalPassportNumberController
                                      .text;
                              patientDetail.guardianName = PatientCardController
                                  .guardianNameController.text;
                              patientDetail.guardianSurname =
                                  PatientCardController
                                      .guardianSurnameController.text;
                              patientDetail.guardianPatronymic =
                                  PatientCardController
                                      .guardianPatronymicController.text;
                              patientDetail.birthCertificateSeries =
                                  PatientCardController
                                      .birthCertificateSeriesController.text;
                              patientDetail.birthCertificateNumber =
                                  PatientCardController
                                      .birthCertificateNumberController.text;
                              patientDetail.birthCertificateIssuingDate =
                                  PatientCardController
                                      .birthCertificateIssuingDateController
                                      .text;
                              patientDetail.birthCertificateIssuedBy =
                                  PatientCardController
                                      .birthCertificateIssuedByController.text;
                              patientDetail.policySeries = PatientCardController
                                  .policySeriesController.text;
                              patientDetail.policyNumber = PatientCardController
                                  .policyNumberController.text;
                              patientDetail.policyIssuedDate =
                                  PatientCardController
                                      .policyIssuedDateController.text;
                              patientDetail.sexName = selectedSex?.name;
                              patientDetail.name =
                                  PatientCardController.nameController.text;
                              patientDetail.surname =
                                  PatientCardController.surnameController.text;
                              patientDetail.patronymic = PatientCardController
                                  .patronymicController.text;
                              patientDetail.dateOfBirth = PatientCardController
                                  .dateOfBirthController.text;
                              patientDetail.comment =
                                  PatientCardController.commentController.text;
                              patientDetail.inn =
                                  PatientCardController.innController.text;
                              patientDetail.email =
                                  PatientCardController.emailController.text;
                              patientDetail.phone =
                                  PatientCardController.phoneController.text;
                              patientDetail.workplace = PatientCardController
                                  .workplaceController.text;
                              patientDetail.profession = PatientCardController
                                  .professionController.text;
                              patientDetail.workExperience =
                                  PatientCardController
                                      .workExperienceController.text;
                              patientDetail.placeOfBirth = PatientCardController
                                  .placeOfBirthController.text;
                              patientDetail.passportCode = PatientCardController
                                  .passportCodeController.text;
                              if (patientDetail.id == null) {
                                NaukaPatientCardClient.create(patientDetail)
                                    .then(
                                  (value) => {
                                    context.read<SelectedPatient>().patient =
                                        value,
                                    context
                                        .read<SelectedPatient>()
                                        .lastUpdateTime = DateTime.now()
                                  },
                                );
                              } else {
                                NaukaPatientCardClient.update(patientDetail)
                                    .then(
                                  (value) => {
                                    context.read<SelectedPatient>().patient =
                                        value,
                                    context
                                        .read<SelectedPatient>()
                                        .lastUpdateTime = DateTime.now(),
                                    selectedSex = Sex(
                                        id: value.sexId, name: value.sexName),
                                  },
                                );
                              }
                            },
                            icon: const Icon(Icons.save, size: 30),
                            color: Colors.blue.withOpacity(0.7),
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            tooltip: 'Найти пациента',
                            onPressed: () {
                              DialogController.findNameController.text =
                                  PatientCardController.nameController.text;
                              DialogController.findSurnameController.text =
                                  PatientCardController.surnameController.text;
                              DialogController.findPatronymicController.text =
                                  PatientCardController
                                      .patronymicController.text;
                              DialogController.findPhoneFindController.text =
                                  PatientCardController.phoneController.text;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const FindPatientDialogPatientCard();
                                },
                              );
                            },
                            icon: const Icon(Icons.find_in_page, size: 30),
                            color: Colors.green.withOpacity(0.7),
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            tooltip: 'Очистить',
                            onPressed: () {
                              PatientCardController
                                  .passportSeriesController.text = '';
                              PatientCardController
                                  .passportNumberController.text = '';
                              PatientCardController
                                  .passportIssuedByController.text = '';
                              PatientCardController
                                  .passportIssuingDateController.text = '';
                              PatientCardController
                                  .addressOfResidenceController.text = '';
                              PatientCardController
                                  .passportAddressOfResidenceController
                                  .text = '';
                              PatientCardController
                                  .internationalNameController.text = '';
                              PatientCardController
                                  .internationalSurnameController.text = '';
                              PatientCardController
                                  .internationalPassportNumberController
                                  .text = '';
                              PatientCardController
                                  .guardianNameController.text = '';
                              PatientCardController
                                  .guardianSurnameController.text = '';
                              PatientCardController
                                  .guardianPatronymicController.text = '';
                              PatientCardController
                                  .birthCertificateSeriesController.text = '';
                              PatientCardController
                                  .birthCertificateNumberController.text = '';
                              PatientCardController
                                  .birthCertificateIssuingDateController
                                  .text = '';
                              PatientCardController
                                  .birthCertificateIssuedByController.text = '';
                              PatientCardController
                                  .policySeriesController.text = '';
                              PatientCardController
                                  .policyNumberController.text = '';
                              PatientCardController
                                  .policyIssuedDateController.text = '';
                              PatientCardController.sexNameController.text = '';
                              PatientCardController.nameController.text = '';
                              PatientCardController.surnameController.text = '';
                              PatientCardController.patronymicController.text =
                                  '';
                              PatientCardController.dateOfBirthController.text =
                                  '';
                              PatientCardController.commentController.text = '';
                              PatientCardController.innController.text = '';
                              PatientCardController.emailController.text = '';
                              PatientCardController.phoneController.text = '';
                              PatientCardController.workplaceController.text =
                                  '';
                              PatientCardController.professionController.text =
                                  '';
                              PatientCardController
                                  .workExperienceController.text = '';
                              PatientCardController
                                  .placeOfBirthController.text = '';
                              PatientCardController
                                  .passportCodeController.text = '';
                              context.read<SelectedPatient>().patient = null;
                              context.read<SelectedCard>().patientCard = null;
                              selectedSex = null;
                            },
                            icon: const Icon(Icons.refresh, size: 30),
                            color: Colors.green.withOpacity(0.7),
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 20),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Данные пациента',
                      labelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Фамилия',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController.surnameController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Имя',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController.nameController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Отчество',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.patronymicController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: FutureBuilder<List<Sex>>(
                            future: NaukaPatientCardClient.getSexes(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: CustomOutlineInputBorder
                                        .outlineInputBorder,
                                    disabledBorder: CustomOutlineInputBorder
                                        .outlineInputBorder,
                                    enabledBorder: CustomOutlineInputBorder
                                        .outlineInputBorder,
                                    focusedBorder: CustomOutlineInputBorder
                                        .outlineInputBorder,
                                    fillColor: Colors.white,
                                    labelStyle: const TextStyle(
                                      color: Colors.green,
                                    ),
                                    label: const Text(
                                      style: CustomTextStyle.textStyle,
                                      textAlign: TextAlign.left,
                                      'Пол',
                                    ),
                                  ),
                                  value: selectedSex?.id != null
                                      ? selectedSex
                                      : null,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items:
                                      snapshot.data!.map<DropdownMenuItem<Sex>>(
                                    (Sex sex) {
                                      return DropdownMenuItem<Sex>(
                                        value: sex,
                                        child: Text(sex.name ?? ''),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (Sex? newValue) {
                                    selectedSex = Sex(
                                        id: newValue?.id, name: newValue?.name);
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('Ошибка: ${snapshot.error}');
                              }
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 25),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Контактные данные',
                      labelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController.emailController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Телефон',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController.phoneController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 25),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Паспортные данные',
                      labelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Серия',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.passportSeriesController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Номер',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.passportNumberController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Кем выдан',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .passportIssuedByController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Дата выдачи',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .passportIssuingDateController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Адрес регистрации',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .passportAddressOfResidenceController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 25),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Данные о работе',
                      labelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Место работы',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.workplaceController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Специальность',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.professionController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Опыт работы',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.workExperienceController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 25),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Данные загранпаспорта',
                      labelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Имя',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .internationalPassportNumberController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Фамилия',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .internationalSurnameController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Номер',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .internationalPassportNumberController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 25),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Данные опекуна',
                      labelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Фамилия',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.guardianSurnameController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Имя',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.guardianNameController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Отчество',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .guardianPatronymicController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 25),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Свидетельство о рождении',
                      labelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Серия',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .birthCertificateSeriesController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Номер',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .birthCertificateNumberController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Кем выдан',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .birthCertificateIssuedByController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Дата выдачи',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .birthCertificateIssuingDateController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 25),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Полис',
                      labelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Серия',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.policySeriesController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Номер',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller:
                                PatientCardController.policyNumberController,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Дата выдачи',
                              labelStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            controller: PatientCardController
                                .policyIssuedDateController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Ошибка: ${snapshot.error}');
        }
        return Container(
          margin: const EdgeInsets.only(top: 20, bottom: 11, left: 6),
          color: Colors.white,
          alignment: Alignment.center,
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Данные пациента',
              labelStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
