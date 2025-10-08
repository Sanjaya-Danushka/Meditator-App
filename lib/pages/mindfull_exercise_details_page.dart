import 'package:flutter/material.dart';
import 'package:meditator/models/mindfull_exercisemodel.dart';
import 'package:meditator/utils/colors.dart';
import 'package:meditator/utils/text_styles.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exercise.name, style: AppTextStyles.titleStyle),
              SizedBox(height: 16),
              Text(exercise.category),
              SizedBox(height: 16),
              Text(exercise.description, textAlign: TextAlign.justify),
              SizedBox(height: 16),
              Text("Instructions:", style: AppTextStyles.titleStyle),
              SizedBox(height: 16),
              ...exercise.instructions.map(
                (instruction) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("•  ", style: TextStyle(fontSize: 16)),
                      Expanded(
                        child: Text(instruction, textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.timer, color: AppColors.primaryGreen),
                  SizedBox(width: 8),
                  Text("${exercise.duration} min"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
