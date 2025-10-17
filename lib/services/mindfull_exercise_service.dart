import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';

class MindFullExerciseService {
  //initilize the hive box
  var mindFullExerciseBox = Hive.box('mindfull_exercises');

  //Method to add a new mindfull exercise
  Future<void> addMindFullExercise(
      MindfulnessExercise mindfullExercise, BuildContext context) async {
    try {
      // Get all the mindfull exercises, if any
      final allMindFullExercises =
          mindFullExerciseBox.get("mindfull_exercises");

      allMindFullExercises.add(mindfullExercise);

      await mindFullExerciseBox.put("mindfull_exercises", allMindFullExercises);

      //show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mindfull exercise added"),
          duration: Duration(seconds: 2),
        ),
      );

      print("Mindfull exercise added");
    } catch (e) {
      print("Service error: $e");
    }
  }

  //Method to get all the mindfull exercises
  List<MindfulnessExercise> getMindFullExercises() {
    try {
      // Get all the mindfull exercises from the Hive box
      final dynamic allMindFullExercises =
          mindFullExerciseBox.get("mindfull_exercises");

      if (allMindFullExercises != null &&
          allMindFullExercises is List<dynamic>) {
        return allMindFullExercises.cast<MindfulnessExercise>().toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Service error: $e");
      return [];
    }
  }

  //Method to delete a mindfull exercise
  Future<void> deleteMindFullExercise(
      MindfulnessExercise mindfullExercise) async {
    try {
      // Get all the mindfull exercises, if any
      final allMindFullExercises =
          mindFullExerciseBox.get("mindfull_exercises");

      allMindFullExercises.remove(mindfullExercise);
      await mindFullExerciseBox.put("mindfull_exercises", allMindFullExercises);

      print("Mindfull exercise deleted");
    } catch (e) {
      print("Service error: $e");
    }
  }
}
