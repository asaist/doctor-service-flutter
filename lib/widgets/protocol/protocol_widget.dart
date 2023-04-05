import 'package:doctor_service_flutter/client/nauka_patient_card_client.dart';
import 'package:doctor_service_flutter/client/nauka_protocol_client.dart';
import 'package:doctor_service_flutter/model/protocol_field.dart';
import 'package:doctor_service_flutter/model/service.dart';
import 'package:doctor_service_flutter/style/custom_outline_input_border.dart';
import 'package:doctor_service_flutter/style/custom_text_style.dart';
import 'package:doctor_service_flutter/widgets/dialogs/add_service_dialog.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_blank.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_card.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_service.dart';
import 'package:doctor_service_flutter/widgets/selected_worker.dart';
import 'package:doctor_service_flutter/widgets/side_bar/nauka_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class ProtocolWidget extends StatefulWidget {
  const ProtocolWidget({Key? key}) : super(key: key);

  @override
  ProtocolWidgetState createState() => ProtocolWidgetState();
}

class ProtocolWidgetState extends State<ProtocolWidget> {
  SidebarXController controller =
      SidebarXController(selectedIndex: 2, extended: true);

  Map<String, TextEditingController> controllers = {};
  Map<TextEditingController, int> idByController = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Протокол'),
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
              IconButton(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  tooltip: 'Меню',
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      drawer: NaukaSideBarWidget(controller),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.94,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Card(
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              tooltip: 'Добавить услугу',
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const SelectServicesDialog();
                                  },
                                );
                              },
                              icon: const Icon(Icons.add_circle, size: 30),
                              color: Colors.blue.withOpacity(0.7),
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            child: IconButton(
                              tooltip: 'Распечатать протокол',
                              onPressed: () {},
                              icon: const Icon(Icons.print, size: 30),
                              color: Colors.blue.withOpacity(0.7),
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20),
                            alignment: Alignment.center,
                            child: IconButton(
                              tooltip: 'Сохранить протокол',
                              onPressed: () {
                                if (context.read<SelectedBlank>().blank?.id ==
                                    null) {
                                  NaukaProtocolClient.createBlank(
                                          context
                                              .read<SelectedPatient>()
                                              .patient
                                              ?.id,
                                          context
                                              .read<SelectedCard>()
                                              .patientCard
                                              ?.id,
                                          context.read<SelectedWorker>().id,
                                          context
                                              .read<SelectedService>()
                                              .services)
                                      .then((value) => context
                                          .read<SelectedBlank>()
                                          .blank = value);
                                } else {
                                  List<ProtocolField> protocolFields = [];
                                  idByController.forEach((key, value) =>
                                      protocolFields.add(ProtocolField(
                                          id: value,
                                          name: '',
                                          result: key.text)));

                                  NaukaProtocolClient.updateProtocol(
                                      context.read<SelectedBlank>(),
                                      protocolFields);
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
                            padding: const EdgeInsets.only(left: 20),
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              tooltip: 'Очистить протокол',
                              onPressed: () {
                                if (context.read<SelectedBlank>().blank?.id ==
                                    null) {
                                  context.read<SelectedService>().services =
                                      List.empty();
                                }
                                for (var element in controllers.values) {
                                  element.text = '';
                                }
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
                ),
                Card(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Услуги",
                      labelStyle: CustomTextStyle.textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: FutureBuilder<List<Service>>(
                      future: NaukaPatientCardClient.getServices(
                          context.watch<SelectedBlank>(),
                          context.watch<SelectedService>()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<DataRow> rows = snapshot.data!
                              .map((e) => DataRow(
                                      onSelectChanged: (val) {
                                        context
                                            .read<SelectedService>()
                                            .service = Service(id: e.id);
                                      },
                                      cells: [
                                        DataCell(
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Text(e.serviceCode ?? ''),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Text(e.serviceName ?? ''),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Text(e.doctorFio ?? ''),
                                          ),
                                        ),
                                      ]))
                              .toList();
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.22,
                            width: MediaQuery.of(context).size.width * 0.99,
                            alignment: Alignment.topCenter,
                            child: SingleChildScrollView(
                              child: DataTable(
                                showCheckboxColumn: false,
                                columns: const [
                                  DataColumn(
                                    label: Text('Код'),
                                  ),
                                  DataColumn(
                                    label: Text('Название'),
                                  ),
                                  DataColumn(
                                    label: Text('ФИО врача'),
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
                          height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width * 0.99,
                          alignment: Alignment.topCenter,
                          child: const CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                Card(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Протокол",
                      labelStyle: CustomTextStyle.textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: FutureBuilder<List<ProtocolField>>(
                      future: NaukaProtocolClient.getProtocolFields(
                          context.watch<SelectedBlank>(),
                          context.watch<SelectedService>().service),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Widget> texts = [];
                          var list = snapshot.data!;
                          for (var element in list) {
                            controllers.putIfAbsent(
                                '${element.name} ${element.id}',
                                () => TextEditingController());
                            controllers['${element.name} ${element.id}']?.text =
                                element.result ?? '';
                            idByController.putIfAbsent(
                                controllers['${element.name} ${element.id}'] ??
                                    TextEditingController(),
                                () => element.id);
                            texts.add(
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 5),
                                child: TextFormField(
                                  controller: controllers[
                                      '${element.name} ${element.id}'],
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
                                    label: Text(
                                      style: CustomTextStyle.textStyle,
                                      textAlign: TextAlign.left,
                                      element.name,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: MediaQuery.of(context).size.width * 0.99,
                            padding: const EdgeInsets.all(5),
                            color: Colors.white,
                            alignment: Alignment.topCenter,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: texts,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                            'Ошибка: ${snapshot.error} ${snapshot.stackTrace}',
                            style: CustomTextStyle.textStyle,
                          );
                        }
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: MediaQuery.of(context).size.width * 0.99,
                          alignment: Alignment.topCenter,
                          child: const CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
