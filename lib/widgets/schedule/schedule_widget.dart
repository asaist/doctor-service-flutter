import 'package:doctor_service_flutter/widgets/schedule/schedule_sf_calendar.dart';
import 'package:doctor_service_flutter/widgets/schedule/schedule_table_calendar.dart';
import 'package:doctor_service_flutter/widgets/schedule/schedule_tree_view.dart';
import 'package:doctor_service_flutter/widgets/side_bar/nauka_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  ScheduleWidgetState createState() => ScheduleWidgetState();
}

class ScheduleWidgetState extends State<ScheduleWidget> {

  @override
  Widget build(BuildContext context) {

    SidebarXController controller =
    SidebarXController(selectedIndex: 0, extended: true);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Расписание'),
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
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.94,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Table(
                        children: <TableRow>[
                          TableRow(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                color: Colors.white,
                                alignment: Alignment.topLeft,
                                child: const SingleChildScrollView(
                                  child: ScheduleTableCalendar(),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.68,
                                color: Colors.white,
                                alignment: Alignment.topLeft,
                                child: const ScheduleTreeView(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.79,
                      height: MediaQuery.of(context).size.height * 0.94,
                      child: const ScheduleSfCalendar(),
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
