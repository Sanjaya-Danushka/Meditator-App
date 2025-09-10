import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditator/pages/mainscreens/create_custome.dart';
import 'package:meditator/pages/mainscreens/custome_exercises.dart';
import 'package:meditator/pages/mainscreens/homepage.dart';
import 'package:meditator/pages/mainscreens/mindfull_exercises.dart';
import 'package:meditator/pages/mainscreens/profile_page.dart';
import 'package:meditator/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  //omport pages
  static const List<Widget> _pages = [
    MindfullExercises(),
    HomePage(),
    CustomExercises(),
    ProfilePage(),
    CreateCustom(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/home.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'Home',
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/brain.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'brain',
              ),
              label: 'Mindfull',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/circle-plus.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'Custom',
              ),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/file-plus-2.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'Profile',
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/user-round-cog.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 4
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
                semanticsLabel: 'Logout',
              ),
              label: 'Logout',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
