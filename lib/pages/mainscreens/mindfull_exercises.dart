import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditator/providers/mindfull_exercise_provider.dart';
import 'package:meditator/router/route_name.dart';
import 'package:meditator/utils/colors.dart';
import 'package:provider/provider.dart';

class MindfullExercises extends StatelessWidget {
  const MindfullExercises({super.key});

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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    hintText: 'Search..',
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 67, 67, 67),
                    ),
                  ),
                  onChanged: (value) {
                    context
                        .read<MindfullExerciseProvider>()
                        .searchMindfullExercise(value);
                  },
                ),
                const SizedBox(height: 20),
                Consumer<MindfullExerciseProvider>(
                  builder: (context, mindfullExercise, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mindfullExercise.MindfullExercises.length,
                      itemBuilder: (context, index) {
                        final exercise =
                            mindfullExercise.MindfullExercises[index];
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              RouteName.mindfullExercisePage,
                              queryParameters: {
                                'mindfulExercise': jsonEncode(exercise),
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.primaryDarkBlue.withAlpha(40),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      exercise.imagePath,
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.13,
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.13,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    exercise.name,
                                    style: const TextStyle(
                                      color: AppColors.primaryPurple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    exercise.description,
                                    style: const TextStyle(
                                      color: AppColors.primaryDarkBlue,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
