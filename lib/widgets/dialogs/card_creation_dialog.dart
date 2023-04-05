import 'package:doctor_service_flutter/client/nauka_patient_card_client.dart';
import 'package:doctor_service_flutter/model/patient_card_type.dart';
import 'package:doctor_service_flutter/style/custom_icon_button.dart';
import 'package:doctor_service_flutter/style/custom_outline_input_border.dart';
import 'package:doctor_service_flutter/style/custom_text_style.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient_card_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardCreationDialog extends StatefulWidget {
  const CardCreationDialog({super.key});

  @override
  CardCreationDialogState createState() => CardCreationDialogState();
}

class CardCreationDialogState extends State<CardCreationDialog> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    final height = MediaQuery.of(context).size.height * 0.2;

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: AlertDialog(
        title: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text('Создание карты'),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: CustomIconButton.buildIconButton(
                  context,
                  'Создать',
                  Colors.green.withOpacity(0.7),
                  Icons.add_circle,
                  30,
                  () {
                    Navigator.of(context).pop();
                    NaukaPatientCardClient.createPatientCard(
                        context.read<SelectedPatient>().patient?.id,
                        context
                            .read<SelectedPatientCardType>()
                            .patientCardType
                            .id);
                    context
                        .read<SelectedPatient>()
                        .lastUpdateTime = DateTime.now();
                  },
                ),
              ),
            ],
          ),
        ),
        content: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder<List<PatientCardType>>(
                future: NaukaPatientCardClient.getPatientCardTypes(),
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
                          'Тип карты',
                        ),
                      ),
                      value: context
                                  .read<SelectedPatientCardType>()
                                  .patientCardType
                                  .id !=
                              null
                          ? context
                              .read<SelectedPatientCardType>()
                              .patientCardType
                          : null,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items:
                          snapshot.data!.map<DropdownMenuItem<PatientCardType>>(
                        (PatientCardType patientCardType) {
                          return DropdownMenuItem<PatientCardType>(
                            value: patientCardType,
                            child: Text(patientCardType.name ?? ''),
                          );
                        },
                      ).toList(),
                      onChanged: (PatientCardType? newValue) {
                        setState(
                          () {
                            context
                                    .read<SelectedPatientCardType>()
                                    .patientCardType =
                                PatientCardType(
                                    id: newValue?.id, name: newValue?.name);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
