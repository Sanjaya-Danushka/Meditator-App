import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meditation/models/meditation_model.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';
import 'package:meditation/models/sleep_content_model.dart';
import 'package:meditation/providers/custom_data_provider.dart';
import 'package:meditation/providers/filter_provider.dart';
import 'package:meditation/providers/meditation_provider.dart';
import 'package:meditation/providers/mindfull_exercise_provider.dart';
import 'package:meditation/providers/sleep_content_provider.dart';
import 'package:meditation/router/router.dart';
import 'package:meditation/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  //register the adapters
  Hive.registerAdapter(MeditationContentAdapter());
  Hive.registerAdapter(MindfulnessExerciseAdapter());
  Hive.registerAdapter(SleepContentAdapter());

  // Open Hive box
  await Hive.openBox('meditations_data');
  await Hive.openBox('mindfull_exercises');
  await Hive.openBox('sleep_contents');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MindfullExerciseProvider()),
        ChangeNotifierProvider(create: (context) => MeditationProvider()),
        ChangeNotifierProvider(create: (context) => SleepContentProvider()),
        ChangeNotifierProvider(create: (context) => FilterdDataprovider()),
        ChangeNotifierProvider(create: (context) => CustomDataProvider()),
      ],

      //initialize Hive
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Meditation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // use inter as the default font
        fontFamily: GoogleFonts.lato().fontFamily,
        scaffoldBackgroundColor: AppColors.primaryWhite,
      ),
      routerConfig: RouterClass().router,
    );
  }
}
