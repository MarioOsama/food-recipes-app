import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.grey,
      fixedColor: AppColors.orange,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
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
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_outline_rounded,
            size: 28,
          ),
          label: 'Favorites',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline_rounded,
            size: 28,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
