import 'package:flutter/material.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';
import 'package:meditation/utils/colors.dart';
import 'package:meditation/utils/text_styles.dart';

class MindFullExerciseTimer extends StatelessWidget {
  final MindfulnessExercise mindfullExercise;

  const MindFullExerciseTimer({
    super.key,
    required this.mindfullExercise,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mindfullExercise.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mindfullExercise.category,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 10),
            Text(mindfullExercise.name, style: AppTextStyles.titleStyle),
            const SizedBox(height: 10),
            Text(
              'Duration: ${mindfullExercise.duration} minutes',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              mindfullExercise.description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...mindfullExercise.instructions.map((instruction) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.primaryGreen.withOpacity(0.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        instruction,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
