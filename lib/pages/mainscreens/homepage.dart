import 'package:flutter/material.dart';
import 'package:meditator/utils/colors.dart';
import 'package:meditator/utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FilterChip(
                            label: Text("All"),
                            onSelected: (value) {},
                          ),
                          const SizedBox(width: 10),
                          FilterChip(
                            label: Text("Mindfullness"),
                            onSelected: (value) {},
                          ),
                          const SizedBox(width: 10),
                          FilterChip(
                            label: Text("Meditation"),
                            onSelected: (value) {},
                          ),
                          const SizedBox(width: 10),
                          FilterChip(
                            label: Text("Sleep Stories"),
                            onSelected: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
