import 'package:flutter/material.dart';
import 'package:meditator/models/meditation_exercise_model.dart';
import 'package:meditator/models/mindfull_exercisemodel.dart';
import 'package:meditator/models/sleep_exercise_model.dart';
import 'package:meditator/providers/meditation_provider.dart';
import 'package:meditator/providers/mindfull_exercise_provider.dart';
import 'package:meditator/providers/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _fallData = [];
  List<dynamic> filteredData = [];

  //get all ther data from other providers
  Future<void> getData(BuildContext context) async {
    await Future.delayed(Duration.zero);

    //mindfull exercise
    final List<MindfullExerciseModel> mindfullExercise =
        Provider.of<MindfullExerciseProvider>(
          context,
          listen: false,
        ).MindfullExercises;

    //meditation exercise
    final List<MeditationExerciseModel> meditationExercise =
        Provider.of<MeditationProvider>(
          context,
          listen: false,
        ).meditationExercises;

    //sleep exercise
    final List<SleepExerciseModel> sleepExercise =
        Provider.of<SleepExerciseProvider>(
          context,
          listen: false,
        ).sleepExercises;

    _fallData = [...mindfullExercise, ...meditationExercise, ...sleepExercise];
    
    filteredData = _fallData;
    notifyListeners();

  }
}
