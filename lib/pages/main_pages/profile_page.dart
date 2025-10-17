import 'package:flutter/material.dart';
import 'package:meditation/services/meditation_service.dart';
import 'package:meditation/services/mindfull_exercise_service.dart';
import 'package:meditation/services/sleep_exercise_service.dart';
import 'package:meditation/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:meditation/providers/custom_data_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profiles",
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Here are your custom exercises',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildSectionTitle('Meditations'),
                  _buildMeditationList(context),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Sleep Content'),
                  _buildSleepContentList(context),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Mindfulness Exercises'),
                  _buildMindfulnessExerciseList(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMeditationList(BuildContext context) {
    final meditations = MeditationService().getMeditations();
    if (meditations.isEmpty) {
      return const Text('No meditations created.');
    }
    return Column(
      children: meditations.map((meditation) {
        return _buildContentTile(
          title: meditation.name,
          description: meditation.description,
          duration: meditation.duration,
        );
      }).toList(),
    );
  }

  Widget _buildSleepContentList(BuildContext context) {
    final sleepContents = SleepExerciseService().getSleepExercises();
    if (sleepContents.isEmpty) {
      return const Text('No sleep content created.');
    }
    return Column(
      children: sleepContents.map((sleepContent) {
        return _buildContentTile(
          title: sleepContent.name,
          description: sleepContent.description,
          duration: sleepContent.duration,
        );
      }).toList(),
    );
  }

  Widget _buildMindfulnessExerciseList(BuildContext context) {
    final exercises = MindFullExerciseService().getMindFullExercises();
    if (exercises.isEmpty) {
      return const Text('No mindfulness exercises created.');
    }
    return Column(
      children: exercises.map((exercise) {
        return _buildContentTile(
          title: exercise.name,
          description: exercise.description,
          duration: exercise.duration,
        );
      }).toList(),
    );
  }

  Widget _buildContentTile({
    required String title,
    required String description,
    required int duration,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '${duration}min',
          style: const TextStyle(
            color: AppColors.primaryPurple,
          ),
        ),
      ),
    );
  }
}
