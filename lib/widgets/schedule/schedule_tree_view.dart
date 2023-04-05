import 'package:doctor_service_flutter/client/nauka_schedule_client.dart';
import 'package:doctor_service_flutter/model/city.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/schedule_shared_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:provider/provider.dart';

class ScheduleTreeView extends StatefulWidget {
  const ScheduleTreeView({super.key});

  @override
  ScheduleTreeViewState createState() => ScheduleTreeViewState();
}

class ScheduleTreeViewState extends State<ScheduleTreeView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CityDetail>>(
      future: NaukaScheduleClient.getDoctors(),
      builder: (context, snapshot) {
        List<Node> nodes = [];
        if (snapshot.hasData) {
          nodes = snapshot.data!
              .map<Node>((e) => Node(
                  key: e.id.toString(),
                  label: e.name,
                  icon: Icons.location_city,
                  children: e.clinics
                      .map((e) => Node(
                          key: e.id.toString(),
                          label: e.name,
                          icon: Icons.house,
                          children: e.specializations
                              .map(
                                (e) => Node(
                                    key: e.id.toString(),
                                    label: e.name,
                                    icon: Icons.type_specimen,
                                    children: e.doctors
                                        .map((e) => Node(
                                            key: e.id.toString(),
                                            label: e.fio,
                                            icon: Icons.account_circle))
                                        .toList()),
                              )
                              .toList()))
                      .toList()))
              .toList();
          TreeViewController controller = TreeViewController(children: nodes);
          String specializationId;
          return TreeView(
            theme: const TreeViewTheme(
              expanderTheme: ExpanderThemeData(
                type: ExpanderType.caret,
                modifier: ExpanderModifier.none,
                position: ExpanderPosition.start,
                color: Colors.green,
                size: 20,
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                letterSpacing: 0.3,
              ),
              parentLabelStyle: TextStyle(
                fontSize: 16,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              iconTheme: IconThemeData(
                size: 18,
                color: Colors.green,
              ),
              colorScheme: ColorScheme.light(),
            ),
            // allowParentSelect: true,
            onNodeTap: (p0) => {
              context.read<ScheduleSharedData>().doctorId =
                  controller.getNode(p0)!.key,
              specializationId = controller.getParent(p0)!.key,
              context.read<ScheduleSharedData>().clinicId =
                  controller.getParent(specializationId)!.key,
            },
            controller: TreeViewController(children: nodes),
          );
        } else if (snapshot.hasError) {
          return Text('Ошибка: ${snapshot.error}');
        }
        return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
