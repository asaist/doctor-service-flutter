import 'package:doctor_service_flutter/client/nauka_schedule_client.dart';
import 'package:doctor_service_flutter/model/patient.dart';
import 'package:doctor_service_flutter/model/status.dart';
import 'package:doctor_service_flutter/style/custom_outline_input_border.dart';
import 'package:doctor_service_flutter/style/custom_text_style.dart';
import 'package:doctor_service_flutter/widgets/dialogs/find_patient_dialog.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:doctor_service_flutter/widgets/schedule/controllers/schedule_controllers.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/schedule_shared_data.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/selected_schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduleDetailDialog extends StatefulWidget {
  const ScheduleDetailDialog({super.key});

  @override
  ScheduleDetailDialogState createState() => ScheduleDetailDialogState();
}

class ScheduleDetailDialogState extends State<ScheduleDetailDialog> {
  @override
  Widget build(BuildContext context) {
    String dateText = DateFormat('dd.MM.yyyy')
        .format(context.read<SelectedSchedule>().schedule!.from)
        .toString();
    String startTimeText = DateFormat('HH:mm')
        .format(context.read<SelectedSchedule>().schedule!.from)
        .toString();
    String endTimeText = DateFormat('HH:mm')
        .format(context.read<SelectedSchedule>().schedule!.to)
        .toString();
    String timeDetails = '$startTimeText - $endTimeText';

    ScheduleController.fioController.text =
        context.read<SelectedSchedule>().schedule!.patientFio ?? '';
    ScheduleController.dateOfBirthController.text =
        context.read<SelectedSchedule>().schedule!.patientBirthDate ?? '';
    ScheduleController.phoneController.text =
        context.read<SelectedSchedule>().schedule!.patientPhone ?? '';
    ScheduleController.commentController.text =
        context.read<SelectedSchedule>().schedule!.comment ?? '';

    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.5,
      child: AlertDialog(
        title: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                    '$dateText $timeDetails'),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  tooltip: 'Найти пациента',
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const FindPatientDialog();
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
            ],
          ),
        ),
        content: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                cursorColor: Colors.black,
                cursorWidth: 1,
                textAlign: TextAlign.left,
                controller: ScheduleController.fioController,
                onChanged: (text) => {
                  context.read<SelectedSchedule>().schedule?.patientFio = text,
                  context.read<SelectedSchedule>().schedule?.patientId = null,
                },
                decoration: InputDecoration(
                  border: CustomOutlineInputBorder.outlineInputBorder,
                  disabledBorder: CustomOutlineInputBorder.outlineInputBorder,
                  enabledBorder: CustomOutlineInputBorder.outlineInputBorder,
                  focusedBorder: CustomOutlineInputBorder.outlineInputBorder,
                  fillColor: Colors.white,
                  labelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                  label: const Text(
                    style: CustomTextStyle.textStyle,
                    textAlign: TextAlign.left,
                    'ФИО пациента',
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.black,
                cursorWidth: 1,
                textAlign: TextAlign.left,
                controller: ScheduleController.dateOfBirthController,
                onChanged: (text) => {
                  context.read<SelectedSchedule>().schedule?.patientBirthDate =
                      text,
                  context.read<SelectedSchedule>().schedule?.patientId = null,
                },
                decoration: InputDecoration(
                  border: CustomOutlineInputBorder.outlineInputBorder,
                  disabledBorder: CustomOutlineInputBorder.outlineInputBorder,
                  enabledBorder: CustomOutlineInputBorder.outlineInputBorder,
                  focusedBorder: CustomOutlineInputBorder.outlineInputBorder,
                  fillColor: Colors.white,
                  labelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                  label: const Text(
                    style: CustomTextStyle.textStyle,
                    textAlign: TextAlign.left,
                    'Дата рождения',
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.black,
                cursorWidth: 1,
                textAlign: TextAlign.left,
                controller: ScheduleController.phoneController,
                onChanged: (text) => {
                  context.read<SelectedSchedule>().schedule?.patientPhone =
                      text,
                  context.read<SelectedSchedule>().schedule?.patientId = null,
                },
                decoration: InputDecoration(
                  border: CustomOutlineInputBorder.outlineInputBorder,
                  disabledBorder: CustomOutlineInputBorder.outlineInputBorder,
                  enabledBorder: CustomOutlineInputBorder.outlineInputBorder,
                  focusedBorder: CustomOutlineInputBorder.outlineInputBorder,
                  fillColor: Colors.white,
                  labelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                  label: const Text(
                    style: CustomTextStyle.textStyle,
                    textAlign: TextAlign.left,
                    'Номер телефона',
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.black,
                cursorWidth: 1,
                textAlign: TextAlign.left,
                controller: ScheduleController.commentController,
                onChanged: (text) => {
                  context.read<SelectedSchedule>().schedule?.comment = text,
                },
                decoration: InputDecoration(
                  border: CustomOutlineInputBorder.outlineInputBorder,
                  disabledBorder: CustomOutlineInputBorder.outlineInputBorder,
                  enabledBorder: CustomOutlineInputBorder.outlineInputBorder,
                  focusedBorder: CustomOutlineInputBorder.outlineInputBorder,
                  fillColor: Colors.white,
                  labelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                  label: const Text(
                    style: CustomTextStyle.textStyle,
                    textAlign: TextAlign.left,
                    'Комментарий',
                  ),
                ),
              ),
              FutureBuilder<List<Status>>(
                future: NaukaScheduleClient.getStatuses(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: CustomOutlineInputBorder.outlineInputBorder,
                        disabledBorder:
                            CustomOutlineInputBorder.outlineInputBorder,
                        enabledBorder:
                            CustomOutlineInputBorder.outlineInputBorder,
                        focusedBorder:
                            CustomOutlineInputBorder.outlineInputBorder,
                        fillColor: Colors.white,
                        labelStyle: const TextStyle(
                          color: Colors.green,
                        ),
                        label: const Text(
                          style: CustomTextStyle.textStyle,
                          textAlign: TextAlign.left,
                          'Статус',
                        ),
                      ),
                      value: Status(
                          id: context
                              .read<SelectedSchedule>()
                              .schedule!
                              .statusId,
                          name: context
                              .read<SelectedSchedule>()
                              .schedule!
                              .statusName),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: snapshot.data!.map<DropdownMenuItem<Status>>(
                        (Status status) {
                          return DropdownMenuItem<Status>(
                            value: status,
                            child: Text(status.name),
                          );
                        },
                      ).toList(),
                      onChanged: (Status? newValue) {
                        setState(
                          () {
                            context
                                .read<SelectedSchedule>()
                                .schedule!
                                .statusId = newValue!.id;
                            context
                                .read<SelectedSchedule>()
                                .schedule!
                                .statusName = newValue.name;
                          },
                        );
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
              )
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      color: Colors.blue,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        NaukaScheduleClient.updateSchedule(
                            context.read<ScheduleSharedData>(),
                            context.read<SelectedSchedule>());
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.save, size: 30),
                      tooltip: 'Сохранить'),
                ),
                Container(
                  alignment: Alignment.center,
                  child: IconButton(
                      disabledColor: Colors.grey.withOpacity(0.1),
                      color: Colors.green,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        int? patientId = context
                            .read<SelectedSchedule>()
                            .schedule!
                            .patientId;
                        if (patientId != null ||
                            ScheduleController.fioController.text.isNotEmpty ||
                            ScheduleController
                                .phoneController.text.isNotEmpty ||
                            ScheduleController
                                .dateOfBirthController.text.isNotEmpty ||
                            ScheduleController
                                .commentController.text.isNotEmpty) {
                          var split =
                              ScheduleController.fioController.text.split(" ");
                          String name = '';
                          String surname = '';
                          String patronymic = '';
                          if (split.length == 3) {
                            surname = split[0];
                            name = split[1];
                            patronymic = split[2];
                          }

                          if (split.length == 2) {
                            surname = split[0];
                            name = split[1];
                          }

                          context.read<SelectedPatient>().patient =
                              PatientDetail(
                            id: patientId,
                            comment: ScheduleController.commentController.text,
                            phone: ScheduleController.phoneController.text,
                            dateOfBirth:
                                ScheduleController.dateOfBirthController.text,
                            name: name,
                            surname: surname,
                            patronymic: patronymic,
                          );
                        }

                        Navigator.of(context).pushNamed("/patient_card");
                      },
                      icon: const Icon(Icons.account_circle, size: 30),
                      tooltip: 'Карта пациента'),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      color: Colors.redAccent.withOpacity(0.7),
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        context.read<SelectedSchedule>().schedule?.statusId =
                            77;
                        context.read<SelectedSchedule>().schedule?.comment =
                            null;
                        context.read<SelectedSchedule>().schedule?.patientId =
                            null;
                        context.read<SelectedSchedule>().schedule?.patientFio =
                            null;
                        context
                            .read<SelectedSchedule>()
                            .schedule
                            ?.patientPhone = null;
                        context
                            .read<SelectedSchedule>()
                            .schedule
                            ?.patientBirthDate = null;
                        NaukaScheduleClient.updateSchedule(
                            context.read<ScheduleSharedData>(),
                            context.read<SelectedSchedule>());
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.remove_circle, size: 30),
                      tooltip: 'Отменить запись'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
