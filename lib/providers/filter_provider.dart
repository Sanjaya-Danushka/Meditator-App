import 'package:flutter/material.dart';
import 'package:meditator/models/meditation_exercise_model.dart';
import 'package:meditator/models/mindfull_exercisemodel.dart';
import 'package:meditator/models/sleep_exercise_model.dart';
import 'package:meditator/providers/meditation_provider.dart';
import 'package:meditator/providers/mindfull_exercise_provider.dart';
import 'package:meditator/providers/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

// Import model classes for type checking

class FilterProvider extends ChangeNotifier {
  List<dynamic> _filteredData = [];
  List<dynamic> filteredData = [];
  String _selectedCategory = "All";

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

    _filteredData = [
      ...mindfullExercise,
      ...meditationExercise,
      ...sleepExercise,
    ];

    filteredData = _filteredData;
    notifyListeners();
  }

  //getter
  List<dynamic> get filterData => _filteredData;

  // method to filter the data
  void filterDataMethod(String category) {
    _selectedCategory = category;
    if (category == "All") {
      filteredData = _filteredData;
    } else if (category == "Mindfullness") {
      // Show all mindfulness exercises (from MindfullExerciseModel)
      filteredData = _filteredData
          .where((exercise) => exercise.runtimeType.toString() == 'MindfullExerciseModel')
          .toList();
    } else if (category == "Meditation") {
      // Show all meditation exercises (from MeditationExerciseModel)
      filteredData = _filteredData
          .where((exercise) => exercise.runtimeType.toString() == 'MeditationExerciseModel')
          .toList();
    } else if (category == "Sleep Stories") {
      // Show all sleep exercises (from SleepExerciseModel)
      filteredData = _filteredData
          .where((exercise) => exercise.runtimeType.toString() == 'SleepExerciseModel')
          .toList();
    }
    // Debug print to check filtered data
    print('Filtering by $category. Found ${filteredData.length} items');
    filteredData.forEach((item) => print(' - ${item.name}: ${item.runtimeType}'));
    notifyListeners();
  }
  //method to return selected category
  String get getSelectedCategory => _selectedCategory;
}
