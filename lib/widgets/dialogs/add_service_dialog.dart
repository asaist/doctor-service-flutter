import 'package:doctor_service_flutter/client/nauka_protocol_client.dart';
import 'package:doctor_service_flutter/model/service.dart';
import 'package:doctor_service_flutter/style/custom_icon_button.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_blank.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_card.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_service.dart';
import 'package:doctor_service_flutter/widgets/selected_worker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectServicesDialog extends StatefulWidget {
  const SelectServicesDialog({super.key});

  @override
  SelectServicesDialogState createState() => SelectServicesDialogState();
}

class SelectServicesDialogState extends State<SelectServicesDialog> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    final height = MediaQuery.of(context).size.height * 0.5;

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
                child: const Text('Добавление услуги'),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: CustomIconButton.buildIconButton(
                  context,
                  'Добавить',
                  Colors.blue.withOpacity(0.7),
                  Icons.add_circle,
                  30,
                  () {
                    Navigator.of(context).pop();
                    context.read<SelectedService>().services.forEach(
                      (element) {
                        element.doctorId = context.read<SelectedWorker>().id;
                      },
                    );
                    if (context.read<SelectedBlank>().blank?.id != 0) {
                      NaukaProtocolClient.addServiceToBlank(
                          context.read<SelectedPatient>().patient?.id,
                          context.read<SelectedCard>().patientCard?.id,
                          context.read<SelectedWorker>().id,
                          context.read<SelectedBlank>(),
                          context.read<SelectedService>());
                      context.read<SelectedBlank>().lastUpdateTime =
                          DateTime.now();
                    } else {
                      NaukaProtocolClient.createBlank(
                        context.read<SelectedPatient>().patient?.id,
                        context.read<SelectedCard>().patientCard?.id,
                        context.read<SelectedWorker>().id,
                        context.read<SelectedService>().services,
                      );
                      context.read<SelectedBlank>().lastUpdateTime =
                          DateTime.now();
                    }
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
          child: ListView(
            children: [
              FutureBuilder<List<Service>>(
                future: NaukaProtocolClient.getServiceByDoctor(
                    context.watch<SelectedWorker>()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DataRow> rows = snapshot.data!
                        .map((e) => DataRow(
                                selected: context
                                    .read<SelectedService>()
                                    .services
                                    .contains(e),
                                onSelectChanged: (val) {
                                  setState(
                                    () {
                                      context
                                              .read<SelectedService>()
                                              .services
                                              .contains(e)
                                          ? context
                                              .read<SelectedService>()
                                              .services
                                              .remove(e)
                                          : context
                                              .read<SelectedService>()
                                              .services
                                              .add(e);
                                    },
                                  );
                                },
                                cells: [
                                  DataCell(
                                    Text(e.serviceCode ?? ''),
                                  ),
                                  DataCell(
                                    Text(e.serviceName ?? ''),
                                  ),
                                ]))
                        .toList();
                    return Container(
                      child: SingleChildScrollView(
                        child: DataTable(
                          showCheckboxColumn: true,
                          columns: const [
                            DataColumn(
                              label: Text('Код'),
                            ),
                            DataColumn(
                              label: Text('Наименование'),
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
            ],
          ),
        ),
      ),
    );
  }
}
