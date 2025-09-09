import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditator/models/meditation_exercise_model.dart';
import 'package:meditator/models/mindfull_exercisemodel.dart';
import 'package:meditator/providers/filter_provider.dart';
import 'package:meditator/utils/colors.dart';
import 'package:meditator/utils/text_styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>(
            context,
            listen: false,
          ).getData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Error loading data"));
            }

            return Consumer<FilterProvider>(
              builder: (context, filterProvider, child) {
                final completedData = filterProvider.filteredData;
                completedData.shuffle();
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/meditation.png",
                              width: MediaQuery.of(context).size.width * 0.09,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Meditation",
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
                          "select a category to start exploring!",
                          style: AppTextStyles.subtitleStyle.copyWith(
                            color: AppColors.primaryDarkBlue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryPurple.withAlpha(80),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  FilterChip(
                                    label: Text("All"),
                                    onSelected: null,
                                  ),
                                  SizedBox(width: 10),
                                  FilterChip(
                                    label: Text("Mindfullness"),
                                    onSelected: null,
                                  ),
                                  SizedBox(width: 10),
                                  FilterChip(
                                    label: Text("Meditation"),
                                    onSelected: null,
                                  ),
                                  SizedBox(width: 10),
                                  FilterChip(
                                    label: Text("Sleep Stories"),
                                    onSelected: null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (completedData.isNotEmpty)
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: completedData.map<Widget>((data) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: data is MindfullExerciseModel
                                        ? AppColors.primaryGreen
                                        : data is MeditationExerciseModel
                                        ? AppColors.primaryPurple
                                        : AppColors.primaryDarkBlue.withAlpha(
                                            140,
                                          ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name,
                                          style: AppTextStyles.titleStyle
                                              .copyWith(
                                                color: AppColors.primaryWhite,
                                              ),
                                        ),
                                        Text(
                                          data.category,
                                          style: AppTextStyles.bodyStyle
                                              .copyWith(
                                                color: AppColors.primaryBlack
                                                    .withAlpha(150),
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          "${data.duration} min",
                                          style: AppTextStyles.bodyStyle
                                              .copyWith(
                                                color: AppColors.primaryBlack
                                                    .withAlpha(100),
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          data.description,
                                          style: AppTextStyles.bodyStyle
                                              .copyWith(
                                                color: AppColors.primaryWhite,
                                                fontWeight: FontWeight.bold,
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
                              ); // Replace with your widget
                            }).toList(),
                          ),
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
