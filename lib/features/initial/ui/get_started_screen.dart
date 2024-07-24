import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/app_assets/app_assets.dart';
import 'package:food_recipes_app/features/initial/ui/widgets/custom_get_started_bottom.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppAssets.getStarted,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Positioned(
                bottom: 10,
                right: 15,
                left: 15,
                child: CustomGetStartedBottom())
          ],
        ),
      ),
    );
  }
}
