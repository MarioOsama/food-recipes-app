import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class CustomGetStartedBottom extends StatelessWidget {
  const CustomGetStartedBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.auth);
        },
        child: Text(
          'Get Started',
          style: AppTextStyles.font17OrangeRegular,
        ),
      ),
    );
  }
}
