import 'package:doctor_service_flutter/widgets/patient_card/patient_blanks_widget.dart';
import 'package:doctor_service_flutter/widgets/patient_card/patient_cards_widget.dart';
import 'package:doctor_service_flutter/widgets/patient_card/patient_details_widget.dart';
import 'package:doctor_service_flutter/widgets/side_bar/nauka_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class PatientCardWidget extends StatefulWidget {
  const PatientCardWidget({Key? key}) : super(key: key);

  @override
  PatientCardWidgetState createState() => PatientCardWidgetState();
}

class PatientCardWidgetState extends State<PatientCardWidget> {
  @override
  Widget build(BuildContext context) {
    SidebarXController controller =
        SidebarXController(selectedIndex: 1, extended: true);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Карта пациента'),
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
                color: Colors.grey.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.94,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const PatientDetailsWidget(),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.94,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ListView(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: const PatientCardsWidget()),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.64,
                            child: const PatientBlanksWidget(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
