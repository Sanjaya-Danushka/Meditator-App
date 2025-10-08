import 'package:flutter/material.dart';
import 'package:meditator/models/mindfull_exercisemodel.dart';
import 'package:meditator/utils/colors.dart';

class MindfullExerciseDetailsPage extends StatelessWidget {
  final MindfullExerciseModel exercise;
  const MindfullExerciseDetailsPage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercise Details',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
    );
  }
}