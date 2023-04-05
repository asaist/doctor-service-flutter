import 'package:doctor_service_flutter/client/nauka_patient_card_client.dart';
import 'package:doctor_service_flutter/model/patient.dart';
import 'package:doctor_service_flutter/widgets/dialogs/controller/dialog_controllers.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectPatientDialogPatientCard extends StatefulWidget {
  const SelectPatientDialogPatientCard({super.key});

  @override
  SelectPatientDialogPatientCardState createState() =>
      SelectPatientDialogPatientCardState();
}

class SelectPatientDialogPatientCardState
    extends State<SelectPatientDialogPatientCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    final height = MediaQuery.of(context).size.height * 0.4;

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: AlertDialog(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'Выбор пациента',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        content: FutureBuilder<List<Patient>>(
          future: NaukaPatientCardClient.getPatients(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataRow> rows = snapshot.data!
                  .map((e) => DataRow(
                          onSelectChanged: (val) {
                            DialogController.findNameController.clear();
                            DialogController.findSurnameController.clear();
                            DialogController.findPatronymicController.clear();
                            DialogController.findPhoneFindController.clear();
                            DialogController.findDateOfBirthController.clear();
                            Navigator.of(context).pop();
                            context.read<SelectedPatient>().patient =
                                PatientDetail(id: e.id);
                          },
                          cells: [
                            DataCell(
                              Text(e.surname),
                            ),
                            DataCell(
                              Text(e.name),
                            ),
                            DataCell(
                              Text(e.patronymic),
                            ),
                            DataCell(
                              Text(e.phone),
                            ),
                            DataCell(
                              Text(e.dateOfBirth),
                            ),
                          ]))
                  .toList();
              return Container(
                child: SingleChildScrollView(
                  child: DataTable(
                    showCheckboxColumn: false,
                    columns: const [
                      DataColumn(
                        label: Text('Фамилия'),
                      ),
                      DataColumn(
                        label: Text('Имя'),
                      ),
                      DataColumn(
                        label: Text('Отчество'),
                      ),
                      DataColumn(
                        label: Text('Телефон'),
                      ),
                      DataColumn(
                        label: Text('Дата рождения'),
                      ),
                    ],
                    rows: rows,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Ошибка: ${snapshot.error}');
            }
            return Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
