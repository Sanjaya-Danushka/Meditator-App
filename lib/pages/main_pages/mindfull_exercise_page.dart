import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';
import 'package:meditation/providers/mindfull_exercise_provider.dart';
import 'package:meditation/router/route_names.dart';
import 'package:meditation/utils/colors.dart';
import 'package:meditation/utils/text_styles.dart';
import 'package:provider/provider.dart';

class MindFullExercisePage extends StatelessWidget {
  const MindFullExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mindfull Exercises',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                // Search bar
                TextField(
                  onChanged: (value) {
                    Provider.of<MindfullExerciseProvider>(context,
                            listen: false)
                        .searchMindfullExercise(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.primaryPurple),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.primaryPurple),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // List of mindfulness activities
                Consumer<MindfullExerciseProvider>(
                  builder: (context, mindfulnessExerciseProvider, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          mindfulnessExerciseProvider.mindfullExercise.length,
                      itemBuilder: (context, index) {
                        MindfulnessExercise mindfullExercise =
                            mindfulnessExerciseProvider.mindfullExercise[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDarkBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                mindfullExercise.imagePath,
                                width: MediaQuery.of(context).size.width * 0.13,
                                height:
                                    MediaQuery.of(context).size.width * 0.13,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              mindfullExercise.name,
                              style: AppTextStyles.subtitleStyle,
                            ),
                            subtitle: Text(
                              mindfullExercise.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyStyle.copyWith(
                                color:
                                    AppColors.primaryDarkBlue.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                RouteNames.mindFullExercise,
                                queryParameters: {
                                  'mindfullExercise':
                                      jsonEncode(mindfullExercise.toJson()),
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
