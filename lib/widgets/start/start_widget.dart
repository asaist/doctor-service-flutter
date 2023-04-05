import 'package:doctor_service_flutter/widgets/side_bar/nauka_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  StartWidgetState createState() => StartWidgetState();
}

class StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    SidebarXController controller =
        SidebarXController(selectedIndex: 0, extended: true);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            tooltip: 'Меню',
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Row(
            children: [NaukaSideBarWidget(controller), Container()],
          )),
    );
  }
}
