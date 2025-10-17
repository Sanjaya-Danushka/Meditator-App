import 'package:flutter/material.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';
import 'package:meditation/providers/custom_data_provider.dart';
import 'package:meditation/utils/colors.dart';
import 'package:provider/provider.dart';

class MindfulExercisesTab extends StatelessWidget {
  const MindfulExercisesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //Add a list of meditations here
            Consumer<CustomDataProvider>(
              builder: (context, data, child) {
                final List<MindfulnessExercise> mindFullData =
                    data.getMindfulExercises();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mindFullData.length,
                  itemBuilder: (context, index) {
                    final MindfulnessExercise mindfulnessExercise =
                        mindFullData[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDarkBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(mindfulnessExercise.name),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryPurple,
                              ),
                              onPressed: () {
                                data.deleteMindfulExercise(mindfulnessExercise);
                              },
                            ),
                          ],
                        ),
                        subtitle: Text(mindfulnessExercise.description),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
