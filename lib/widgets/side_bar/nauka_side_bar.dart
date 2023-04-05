import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class NaukaSideBarWidget extends StatefulWidget {
  const NaukaSideBarWidget(this.controller, {Key? key}) : super(key: key);

  final controller;

  @override
  NaukaSideBareWidgetState createState() => NaukaSideBareWidgetState();
}

class NaukaSideBareWidgetState extends State<NaukaSideBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        textStyle: TextStyle(color: Colors.black, fontSize: 15),
        selectedTextStyle: TextStyle(color: Colors.green, fontSize: 15),
      ),
      extendedTheme:
          SidebarXTheme(width: MediaQuery.of(context).size.width * 0.15),
      controller: widget.controller,
      headerBuilder: (context, extended) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Меню',
            style: TextStyle(
                color: Colors.green, fontSize: 17, fontWeight: FontWeight.w700),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.schedule,
          label: 'Расписание',
          onTap: () {
            Navigator.of(context).pushNamed("/schedule");
          },
        ),
        SidebarXItem(
          icon: Icons.account_circle,
          label: 'Карта пациента',
          onTap: () {
            Navigator.of(context).pushNamed("/patient_card");
          },
        ),
        SidebarXItem(
          icon: Icons.list_alt,
          label: 'Протокол',
          onTap: () {
            Navigator.of(context).pushNamed("/protocol");
          },
        ),
        SidebarXItem(
          iconWidget: const Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ),
          label: 'Выход',
          onTap: () {
            Navigator.of(context).pushNamed("/login");
          },
        ),
      ],
    );
  }
}
