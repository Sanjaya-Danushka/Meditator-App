import 'package:flutter/material.dart';
import 'package:meditation/utils/colors.dart';
import 'package:meditation/widgets/meditatio_form.dart';
import 'package:meditation/widgets/mindufull_exercise_from.dart';
import 'package:meditation/widgets/sleep_content_form.dart';

class CreateCustomExercise extends StatefulWidget {
  const CreateCustomExercise({super.key});

  @override
  State<CreateCustomExercise> createState() => _CreateCustomExerciseState();
}

class _CreateCustomExerciseState extends State<CreateCustomExercise> {
  //slect the type of content
  String typeOfContent = 'Meditation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Custom Exercise',
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              //seelctor for the user to select the type of meditation or sleep content or mindfulness content
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align Row to the start
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryPurple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: AppColors.primaryPurple,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: typeOfContent,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.primaryPurple,
                            ),
                            isExpanded: true,
                            items: ['Meditation', 'Sleep', 'Mindfulness']
                                .map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primaryDarkBlue,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                typeOfContent = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                //render the form based on the type of content selected
                if (typeOfContent == 'Meditation')
                  MeditationForm()
                else if (typeOfContent == 'Sleep')
                  SleepContentForm()
                else if (typeOfContent == 'Mindfulness')
                  MindFullExerciseForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
