import 'package:flutter/material.dart';
import 'package:meditation/models/meditation_model.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';
import 'package:meditation/models/sleep_content_model.dart';
import 'package:meditation/services/meditation_service.dart';
import 'package:meditation/services/mindfull_exercise_service.dart';
import 'package:meditation/services/sleep_exercise_service.dart';

class CustomDataProvider extends ChangeNotifier {
  final List<MeditationContent> _meditations = [];
  final List<SleepContent> _sleepExercises = [];
  final List<MindfulnessExercise> _mindfulExercises = [];

  List<MeditationContent> get meditations => _meditations;
  List<SleepContent> get sleepExercises => _sleepExercises;
  List<MindfulnessExercise> get mindfulExercises => _mindfulExercises;

  Null get userCreatedMeditations => null;

  Null get userCreatedSleepExercises => null;

  Null get userCreatedMindfullExercises => null;

  //Methode to add a new meditation
  void addMeditation(MeditationContent meditation, BuildContext context) {
    try {
      _meditations.add(meditation);

      //also update the Hive box

      try {
        MeditationService().addMeditation(meditation, context);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Method to delete a meditation
  void deleteMeditation(MeditationContent meditation, BuildContext context) {
    try {
      _meditations.remove(meditation);

      //also update the Hive box
      try {
        MeditationService().deleteMeditation(meditation, context);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Method to get all the meditations
  List<MeditationContent> getMeditations() {
    try {
      //get all the meditations
      final List<MeditationContent> allMeditatios =
          MeditationService().getMeditations();

      // print("all meditations: $allMeditatios");

      return allMeditatios;
    } catch (e) {
      print("get meditations error from provider: $e");
      return [];
    }
  }

  // Method to add a new sleep content
  void addSleepContent(SleepContent sleepContent, BuildContext context) {
    try {
      _sleepExercises.add(sleepContent);

      //also update the Hive box
      try {
        SleepExerciseService().addSleepExercise(sleepContent, context);
      } catch (e) {
        print(e);
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Method to delete a sleep content
  void deleteSleepContent(SleepContent sleepContent, BuildContext context) {
    try {
      _sleepExercises.remove(sleepContent);

      //also update the Hive box
      try {
        SleepExerciseService().deleteSleepExercise(sleepContent, context);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //get all the sleep exercises
  List<SleepContent> getSleepExercises() {
    try {
      //get all the sleep exercises
      final List<SleepContent> allSleepExercises =
          SleepExerciseService().getSleepExercises();

      print("all sleep exercises: $allSleepExercises");

      return allSleepExercises;
    } catch (e) {
      print("get sleep exercises error from provider: $e");
      return [];
    }
  }

  //Method to add a new mindfulness exercise
  void addMindfulExercise(
      MindfulnessExercise mindfulExercise, BuildContext context) {
    try {
      _mindfulExercises.add(mindfulExercise);

      //also update the Hive box
      try {
        MindFullExerciseService().addMindFullExercise(mindfulExercise, context);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Method to delete a mindfulness exercise
  void deleteMindfulExercise(MindfulnessExercise mindfulExercise) {
    try {
      _mindfulExercises.remove(mindfulExercise);

      //also update the Hive box
      try {
        MindFullExerciseService().deleteMindFullExercise(mindfulExercise);
      } catch (e) {
        print(e);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //get all the mindfulness exercises
  List<MindfulnessExercise> getMindfulExercises() {
    try {
      //get all the mindfulness exercises
      final List<MindfulnessExercise> allMindfulExercises =
          MindFullExerciseService().getMindFullExercises();

      print("all mindfulness exercises: $allMindfulExercises");

      return allMindfulExercises;
    } catch (e) {
      print("get mindfulness exercises error from provider: $e");
      return [];
    }
  }
}
