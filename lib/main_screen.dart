import 'package:flutter/material.dart';
import 'package:food_recipes_app/features/favourite/ui/favourite_screen.dart';
import 'package:food_recipes_app/features/home/ui/home_screen.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/profile/presentation/pages/profile/profile_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> navigationRoutes = const [
    HomeScreen(),
    FavouriteScreen(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationRoutes[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.grey,
        fixedColor: AppColors.orange,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          if (value == currentIndex) return;
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home_outlined,
              size: 28,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home_rounded,
              size: 28,
              color: AppColors.orange,
              shadows: [
                BoxShadow(
                  color: AppColors.orange.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(2, 5),
                  spreadRadius: 5,
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.favorite_outline_rounded,
              size: 28,
            ),
            label: 'Favorites',
            activeIcon: Icon(
              Icons.favorite_rounded,
              size: 28,
              color: AppColors.orange,
              shadows: [
                BoxShadow(
                  color: AppColors.orange.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(2, 5),
                  spreadRadius: 5,
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person_outline_rounded,
              size: 28,
            ),
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              size: 28,
              color: AppColors.orange,
              shadows: [
                BoxShadow(
                  color: AppColors.orange.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(2, 5),
                  spreadRadius: 5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
