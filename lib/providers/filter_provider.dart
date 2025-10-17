import 'package:flutter/material.dart';
import 'package:meditation/models/meditation_model.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';
import 'package:meditation/models/sleep_content_model.dart';
import 'package:meditation/providers/meditation_provider.dart';
import 'package:meditation/providers/mindfull_exercise_provider.dart';
import 'package:meditation/providers/sleep_content_provider.dart';
import 'package:provider/provider.dart';

class FilterdDataprovider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filteredData = [];
  String _selectedCategory = "All"; // Add this

  List<dynamic> get filteredData => _filteredData;

  Future<void> getData(BuildContext context) async {
    await Future.delayed(Duration.zero); // Ensures this runs after build

    final List<MindfulnessExercise> mindfullExercise =
        Provider.of<MindfullExerciseProvider>(context, listen: false)
            .mindfullExercise;

    final List<SleepContent> sleepContent =
        Provider.of<SleepContentProvider>(context, listen: false).sleepExercise;

    final List<MeditationContent> meditations =
        Provider.of<MeditationProvider>(context, listen: false)
            .meditatonExercise;

    _allData = [
      ...mindfullExercise,
      ...sleepContent,
      ...meditations,
    ];

    _filteredData = _allData;
    notifyListeners();
  }

  void filterData(String category) {
    _selectedCategory = category;
    if (category == "All") {
      _filteredData = _allData;
    } else if (category == "Mindfulness") {
      _filteredData = _allData.whereType<MindfulnessExercise>().toList();
    } else if (category == "Meditation") {
      _filteredData = _allData.whereType<MeditationContent>().toList();
    } else if (category == "Sleep Stories") {
      _filteredData = _allData.whereType<SleepContent>().toList();
    }
    notifyListeners();
  }

  //Method to return the selected category
  // Get the current selected category
  String getSelectedCategory() {
    return _selectedCategory; // Update this
  }
}
