import 'package:doctor_service_flutter/client/nauka_patient_card_client.dart';
import 'package:doctor_service_flutter/model/patient_card.dart';
import 'package:doctor_service_flutter/widgets/dialogs/card_creation_dialog.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_card.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientCardsWidget extends StatefulWidget {
  const PatientCardsWidget({super.key});

  @override
  PatientCardsWidgetState createState() => PatientCardsWidgetState();
}

class PatientCardsWidgetState extends State<PatientCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PatientCard>>(
      future: NaukaPatientCardClient.getCards(context.watch<SelectedPatient>()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DataRow> rows = snapshot.data!
              .map(
                (e) => DataRow(
                  onSelectChanged: (val) {
                    context.read<SelectedCard>().patientCard = e;
                  },
                  cells: [
                    DataCell(
                      Text(e.cardTypeName ?? ''),
                    ),
                    DataCell(
                      Text(e.cardNumber ?? ''),
                    ),
                    DataCell(
                      Text(e.startDate ?? ''),
                    ),
                    DataCell(
                      Text(e.endDate ?? ''),
                    ),
                    DataCell(
                      Checkbox(
                        value: e.isDeleted ?? false,
                        onChanged: (bool? value) {},
                      ),
                    ),
                  ],
                ),
              )
              .toList();
          return Container(
            padding: const EdgeInsets.all(7),
            color: Colors.white12,
            child: Card(
              margin: const EdgeInsets.only(top: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Карты',
                  labelStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.topRight,
                      child: IconButton(
                        tooltip: 'Создать карту',
                        onPressed: () {
                          if (context.read<SelectedPatient>().patient?.id !=
                              null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const CardCreationDialog();
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Center(child: Text('Ошибка')),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Center(
                                            child: Text(
                                                'Пациент не выбран или не сохранен')),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        icon: const Icon(Icons.add_circle, size: 30),
                        color: Colors.blue.withOpacity(0.7),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ),
                    DataTable(
                      showCheckboxColumn: false,
                      columns: const [
                        DataColumn(
                          label: Text('Тип'),
                        ),
                        DataColumn(
                          label: Text('Номер'),
                        ),
                        DataColumn(
                          label: Text('Дата начала действия'),
                        ),
                        DataColumn(
                          label: Text('Дата окончания действия'),
                        ),
                        DataColumn(
                          label: Text('Удалена'),
                        ),
                      ],
                      rows: rows,
                    ),
                  ],
                ),
              ),
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
              labelText: 'Карты',
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
