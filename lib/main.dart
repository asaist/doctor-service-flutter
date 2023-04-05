import 'package:doctor_service_flutter/widgets/login/login_widget.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_blank.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_card.dart';
import 'package:doctor_service_flutter/widgets/patient_card/data/selected_patient.dart';
import 'package:doctor_service_flutter/widgets/patient_card/patient_card_widget.dart';
import 'package:doctor_service_flutter/widgets/protocol/protocol_widget.dart';
import 'package:doctor_service_flutter/widgets/schedule/data/selected_schedule.dart';
import 'package:doctor_service_flutter/widgets/schedule/schedule_widget.dart';
import 'package:doctor_service_flutter/widgets/start/start_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'widgets/patient_card/data/selected_patient_card_type.dart';
import 'widgets/patient_card/data/selected_service.dart';
import 'widgets/protocol/data/selected_clinic.dart';
import 'widgets/schedule/data/schedule_shared_data.dart';
import 'widgets/selected_worker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedCard()),
        ChangeNotifierProvider(create: (context) => SelectedBlank()),
        ChangeNotifierProvider(create: (context) => SelectedClinic()),
        ChangeNotifierProvider(create: (context) => SelectedWorker()),
        ChangeNotifierProvider(create: (context) => SelectedPatient()),
        ChangeNotifierProvider(create: (context) => SelectedService()),
        ChangeNotifierProvider(create: (context) => SelectedSchedule()),
        ChangeNotifierProvider(create: (context) => ScheduleSharedData()),
        ChangeNotifierProvider(create: (context) => SelectedPatientCardType()),
      ],
      child: MaterialApp(
        locale: const Locale('ru', 'RU'),
        supportedLocales: const [
          Locale('ru', 'RU'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.green),
        ),
        home: const LoginWidget(),
        routes: {
          "/start": (_) => const StartWidget(),
          "/login": (_) => const LoginWidget(),
          "/schedule": (_) => const ScheduleWidget(),
          "/protocol": (_) => const ProtocolWidget(),
          "/patient_card": (_) => const PatientCardWidget(),
        },
      ),
    );
  }
}
