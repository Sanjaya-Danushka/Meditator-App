import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation/models/functions_model.dart';
import 'package:meditation/models/mindfull_exercise_model.dart';
import 'package:meditation/models/sleep_content_model.dart';
import 'package:meditation/providers/filter_provider.dart';
import 'package:meditation/router/route_names.dart';
import 'package:meditation/utils/colors.dart';
import 'package:meditation/utils/text_styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // handle meditation pressed
  void openBottomSheet(BuildContext context, final title, final duration,
      final description, final category, final videoUrl) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryPurple,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGrey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  '$duration min',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          AppColors.primaryGreen,
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        shadowColor: WidgetStateProperty.all<Color>(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        GoRouter.of(context).push(
                          '/functions',
                          // Passing the data to the next page
                          extra: FunctionsData(
                            category,
                            title: title,
                            duration: duration,
                            description: description,
                            url: videoUrl,
                          ),
                        );

                        //close the bottom sheet
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Start",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          AppColors.primaryGrey,
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        shadowColor: WidgetStateProperty.all<Color>(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Close",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //handle mindfullness exercises pressed
  void handleMindfullnessPressed(
      BuildContext context, MindfulnessExercise data) {
    GoRouter.of(context)
        .pushNamed(RouteNames.midfullExerciseTimer, queryParameters: {
      'mindfullExercise': jsonEncode(
        data.toJson(),
      )
    });
  }

  //handle sleep stories pressed
  void handleSleepStoriesPressed(BuildContext context, SleepContent data) {
    GoRouter.of(context)
        .pushNamed(RouteNames.sleepStoryTimer, queryParameters: {
      'sleepContent': jsonEncode(data.toJson()),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterdDataprovider>(context, listen: false)
              .getData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            }

            return Consumer<FilterdDataprovider>(
              builder: (context, filterData, child) {
                final completeData = filterData.filteredData;

                // Rearrange the data to show in the UI
                completeData.shuffle();
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/meditation.png",
                              width: MediaQuery.of(context).size.width * 0.09,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Meditator",
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryPurple,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Select a category to start exploring",
                          style: AppTextStyles.subtitleStyle.copyWith(
                            color: AppColors.primaryDarkBlue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryPurple.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    FilterChip(
                                      label: Text(
                                        "All",
                                        style: TextStyle(
                                          color: filterData
                                                      .getSelectedCategory() ==
                                                  "All"
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      selected:
                                          filterData.getSelectedCategory() ==
                                              "All",
                                      onSelected: (bool value) {
                                        filterData.filterData("All");
                                      },
                                      showCheckmark: false,
                                      selectedColor: AppColors.primaryPurple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: AppColors.primaryPurple
                                              .withOpacity(0.5),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    FilterChip(
                                      label: Text(
                                        "Mindfulness",
                                        style: TextStyle(
                                          color: filterData
                                                      .getSelectedCategory() ==
                                                  "Mindfulness"
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        filterData.filterData("Mindfulness");
                                      },
                                      showCheckmark: false,
                                      selected:
                                          filterData.getSelectedCategory() ==
                                              "Mindfulness",
                                      selectedColor: AppColors.primaryPurple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: AppColors.primaryPurple
                                              .withOpacity(0.5),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    FilterChip(
                                      label: Text(
                                        "Meditation",
                                        style: TextStyle(
                                          color: filterData
                                                      .getSelectedCategory() ==
                                                  "Meditation"
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      selected:
                                          filterData.getSelectedCategory() ==
                                              "Meditation",
                                      onSelected: (bool value) {
                                        filterData.filterData("Meditation");
                                      },
                                      showCheckmark: false,
                                      selectedColor: AppColors.primaryPurple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: AppColors.primaryPurple
                                              .withOpacity(0.5),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    FilterChip(
                                      label: Text(
                                        "Sleep Stories",
                                        style: TextStyle(
                                          color: filterData
                                                      .getSelectedCategory() ==
                                                  "Sleep Stories"
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),

                                      //change the color of the selected chip
                                      showCheckmark: false,
                                      selected:
                                          filterData.getSelectedCategory() ==
                                              "Sleep Stories",
                                      onSelected: (bool value) {
                                        filterData.filterData("Sleep Stories");
                                      },
                                      selectedColor: AppColors.primaryPurple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: AppColors.primaryPurple
                                              .withOpacity(0.5),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        const SizedBox(height: 20),
                        if (completeData.isNotEmpty)
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: completeData.map((data) {
                              return GestureDetector(
                                onTap: () {
                                  //handle the event according to the data type
                                  if (data is MindfulnessExercise) {
                                    handleMindfullnessPressed(context, data);
                                  } else if (data is SleepContent) {
                                    handleSleepStoriesPressed(context, data);
                                  } else {
                                    openBottomSheet(
                                      context,
                                      data.name,
                                      data.duration,
                                      data.description,
                                      data.category,
                                      data.videoUrl ?? '',
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: data is MindfulnessExercise
                                        ? AppColors.primaryGreen.withOpacity(1)
                                        : data is SleepContent
                                            ? AppColors.primaryPurple
                                                .withOpacity(1)
                                            : AppColors.primaryDarkBlue
                                                .withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name,
                                          style:
                                              AppTextStyles.titleStyle.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                        ),
                                        Text(
                                          data.category,
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryBlack
                                                .withOpacity(0.5),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${data.duration} min',
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryBlack
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                        Text(data.name),
                                        Text(
                                          data.description,
                                          style:
                                              AppTextStyles.bodyStyle.copyWith(
                                            color: AppColors.primaryWhite,
                                          ),
                                          maxLines:
                                              (data.description.length / 2)
                                                  .toInt(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                        else
                          const Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
