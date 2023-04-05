import 'package:doctor_service_flutter/client/nauka_schedule_client.dart';
import 'package:doctor_service_flutter/model/schedule.dart';
import 'package:doctor_service_flutter/widgets/dialogs/schedule_detail_dialog.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/schedule_shared_data.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/selected_schedule.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleSfCalendar extends StatefulWidget {
  const ScheduleSfCalendar({super.key});

  @override
  ScheduleSfCalendarState createState() => ScheduleSfCalendarState();
}

class ScheduleSfCalendarState extends State<ScheduleSfCalendar> {
  void calendarTapped(CalendarTapDetails details, BuildContext context) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      final Schedule schedule = details.appointments![0];
      context.read<SelectedSchedule>().schedule = schedule;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ScheduleDetailDialog();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Schedule>>(
      future:
          NaukaScheduleClient.getSchedule(context.watch<ScheduleSharedData>()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SfCalendar(
            timeSlotViewSettings: const TimeSlotViewSettings(
                timeInterval: Duration(minutes: 15),
                timeFormat: 'HH:mm',
                timeIntervalHeight: 50,
                startHour: 7,
                endHour: 22),
            view: CalendarView.week,
            //TODO https://www.youtube.com/watch?v=nXNX-6leMvo
            //TODO https://pub.dev/packages/syncfusion_flutter_calendar
            dataSource: ScheduleDataSource(snapshot.data!),
            cellBorderColor: Colors.grey.withOpacity(0.7),
            onTap: (details) => calendarTapped(details, context),
            appointmentTextStyle: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
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
