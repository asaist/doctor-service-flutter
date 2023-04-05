import 'package:doctor_service_flutter/style/custom_icon_button.dart';
import 'package:doctor_service_flutter/style/custom_outline_input_border.dart';
import 'package:doctor_service_flutter/style/custom_text_style.dart';
import 'package:doctor_service_flutter/widgets/dialogs/controller/dialog_controllers.dart';
import 'package:doctor_service_flutter/widgets/dialogs/select_patient_dialog.dart';
import 'package:flutter/material.dart';

import 'select_patient_dialog_patient_card.dart';

class FindPatientDialogPatientCard extends StatefulWidget {
  const FindPatientDialogPatientCard({super.key});

  @override
  FindPatientDialogPatientCardState createState() => FindPatientDialogPatientCardState();
}

class FindPatientDialogPatientCardState extends State<FindPatientDialogPatientCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    final height = MediaQuery.of(context).size.height * 0.3;

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
                child: const Text('Найти пациента'),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: CustomIconButton.buildIconButton(
                  context,
                  'Найти',
                  Colors.green.withOpacity(0.7),
                  Icons.find_in_page,
                  30,
                  () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SelectPatientDialogPatientCard();
                      },
                    );
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
               _PatientSearchTextFormField(
                'Фамилия пациента',
                DialogController.findSurnameController,
              ),
              _PatientSearchTextFormField(
                'Имя пациента',
                DialogController.findNameController,
              ),
              _PatientSearchTextFormField(
                'Отчество пациента',
                DialogController.findPatronymicController,
              ),
              _PatientSearchTextFormField(
                'Номер пациента',
                DialogController.findPhoneFindController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatientSearchTextFormField extends StatelessWidget {
  final String _labelText;
  final TextEditingController _controller;

  const _PatientSearchTextFormField(
    this._labelText,
    this._controller,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      cursorWidth: 1,
      textAlign: TextAlign.center,
      controller: _controller,
      decoration: InputDecoration(
        border: CustomOutlineInputBorder.outlineInputBorder,
        disabledBorder: CustomOutlineInputBorder.outlineInputBorder,
        enabledBorder: CustomOutlineInputBorder.outlineInputBorder,
        focusedBorder: CustomOutlineInputBorder.outlineInputBorder,
        fillColor: Colors.white,
        labelStyle: CustomTextStyle.textStyle,
        label: Text(
          style: CustomTextStyle.textStyle,
          textAlign: TextAlign.left,
          _labelText,
        ),
      ),
    );
  }
}
