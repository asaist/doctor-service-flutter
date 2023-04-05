import 'package:doctor_service_flutter/client/nauka_patient_card_client.dart';
import 'package:doctor_service_flutter/model/blank.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_blank.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_card.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:doctor_service_flutter/widgets/selected_worker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientBlanksWidget extends StatefulWidget {
  const PatientBlanksWidget({super.key});

  @override
  PatientBlanksWidgetState createState() => PatientBlanksWidgetState();
}

class PatientBlanksWidgetState extends State<PatientBlanksWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Blank>>(
      future: NaukaPatientCardClient.getBlanks(
          context.watch<SelectedCard>().patientCard?.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DataRow> rows = snapshot.data!
              .map(
                (e) => DataRow(
                  onSelectChanged: (val) {
                    context.read<SelectedBlank>().blank = Blank(id: e.id);
                    Navigator.of(context).pushNamed("/protocol");
                  },
                  cells: [
                    DataCell(
                      Text(e.date ?? ''),
                    ),
                    DataCell(
                      Text(e.filialCode ?? ''),
                    ),
                    DataCell(
                      Text(e.number?.toString() ?? ''),
                    ),
                  ],
                ),
              )
              .toList();
          return Container(
            padding: const EdgeInsets.all(7),
            color: Colors.white12,
            child: Card(
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Бланки',
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
                        tooltip: 'Создать бланк',
                        onPressed: () {
                          if (context.read<SelectedCard>().patientCard?.id !=
                                  null &&
                              context.read<SelectedWorker>().id != 0 &&
                              context.read<SelectedPatient>().patient?.id !=
                                  null) {
                            context.read<SelectedBlank>().blank = null;
                            context.read<SelectedBlank>().lastUpdateTime = DateTime.now();
                            Navigator.of(context).pushNamed("/protocol");
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
                                                'Не выбрана карта пациента')),
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
                          label: Text('Дата'),
                        ),
                        DataColumn(
                          label: Text('Код клиники'),
                        ),
                        DataColumn(
                          label: Text('Номер'),
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
          return Text('Ошибка: ${snapshot.error} ${snapshot.stackTrace}');
        }
        return Container(
          margin: const EdgeInsets.only(top: 20, bottom: 6, left: 6),
          color: Colors.white,
          alignment: Alignment.center,
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Бланки',
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
