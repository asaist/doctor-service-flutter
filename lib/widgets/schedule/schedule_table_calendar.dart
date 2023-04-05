import 'package:doctor_service_flutter/model/schedule.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/schedule_shared_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleTableCalendar extends StatefulWidget {
  const ScheduleTableCalendar({super.key});

  @override
  ScheduleTableCalendarState createState() => ScheduleTableCalendarState();
}

class ScheduleTableCalendarState extends State<ScheduleTableCalendar> {
  final _calendarToday = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  void _onDaySelected(DateTime newSelectedDay, DateTime newFocusedDay) {
    if (!isSameDay(
        newSelectedDay, context.read<ScheduleSharedData>().selectedDay)) {
      setState(
        () {
          context.read<ScheduleSharedData>().selectedDay = newSelectedDay;
          context.read<ScheduleSharedData>().focusedDay = newFocusedDay;
          context.read<ScheduleSharedData>().rangeStart = null;
          context.read<ScheduleSharedData>().rangeEnd = null;
          _rangeSelectionMode = RangeSelectionMode.toggledOff;
        },
      );
    }
  }

  void _onRangeSelected(
      DateTime? newStart, DateTime? newEnd, DateTime newFocusedDay) {
    setState(
      () {
        context.read<ScheduleSharedData>().selectedDay = null;
        context.read<ScheduleSharedData>().focusedDay = newFocusedDay;
        context.read<ScheduleSharedData>().rangeStart = newStart;
        context.read<ScheduleSharedData>().rangeEnd = newEnd;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar<Schedule>(
      rowHeight: 40,
      locale: Localizations.localeOf(context).languageCode,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontSize: 14,
          color: Colors.black.withOpacity(0.9),
          fontWeight: FontWeight.bold,
        ),
        weekendStyle: TextStyle(
          fontSize: 14,
          color: Colors.red.withOpacity(0.5),
          fontWeight: FontWeight.bold,
        ),
      ),
      headerStyle: const HeaderStyle(
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        titleCentered: true,
        formatButtonVisible: false,
      ),
      firstDay: DateTime(
          _calendarToday.year, _calendarToday.month - 3, _calendarToday.day),
      lastDay: DateTime(
          _calendarToday.year, _calendarToday.month + 3, _calendarToday.day),
      focusedDay: context.read<ScheduleSharedData>().focusedDay,
      selectedDayPredicate: (day) =>
          isSameDay(context.read<ScheduleSharedData>().selectedDay, day),
      rangeStartDay: context.read<ScheduleSharedData>().rangeStart,
      rangeEndDay: context.read<ScheduleSharedData>().rangeEnd,
      calendarFormat: _calendarFormat,
      rangeSelectionMode: _rangeSelectionMode,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        markersMaxCount: 0,
        selectedDecoration: BoxDecoration(
          color: Colors.green.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.green.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        rangeStartDecoration: BoxDecoration(
          color: Colors.lightGreen.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        rangeEndDecoration: BoxDecoration(
          color: Colors.lightGreen.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        rangeHighlightColor: Colors.lightGreen.withOpacity(0.5),
        holidayTextStyle: const TextStyle(fontSize: 13),
        defaultTextStyle: const TextStyle(fontSize: 13),
        todayTextStyle: const TextStyle(fontSize: 13),
        selectedTextStyle: const TextStyle(fontSize: 13),
        disabledTextStyle: const TextStyle(fontSize: 13),
        outsideTextStyle:
            TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.3)),
        rangeEndTextStyle: const TextStyle(fontSize: 13),
        rangeStartTextStyle: const TextStyle(fontSize: 13),
        weekendTextStyle:
            TextStyle(fontSize: 13, color: Colors.red.withOpacity(0.5)),
        weekNumberTextStyle: const TextStyle(fontSize: 13),
        withinRangeTextStyle: const TextStyle(fontSize: 13),
        outsideDaysVisible: true,
      ),
      onDaySelected: _onDaySelected,
      onRangeSelected: _onRangeSelected,
      onPageChanged: (focusedDay) {
        focusedDay = focusedDay;
      },
    );
  }
}
