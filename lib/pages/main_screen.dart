import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation/pages/main_pages/create_custom_exercise.dart';
import 'package:meditation/pages/main_pages/home_page.dart';
import 'package:meditation/pages/main_pages/mindfull_exercise_page.dart';
import 'package:meditation/pages/main_pages/profile_page.dart';
import 'package:meditation/pages/main_pages/custum_exercises.dart';
import 'package:meditation/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    MindFullExercisePage(),
    CreateCustomExercise(),
    CustomExercises(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a transparent background
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'My SVG Image',
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/brain.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'My SVG Image',
                height: 25,
                width: 25,
              ),
              label: 'Mediation',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/circle-plus.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'My SVG Image',
              ),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/file-plus-2.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'My SVG Image',
              ),
              label: 'Stats',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/user-round-cog.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 4
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'My SVG Image',
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primaryPurple,
          unselectedItemColor: AppColors.primaryDarkBlue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
