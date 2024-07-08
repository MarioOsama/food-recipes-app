import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/routing/app_router.dart';
import 'package:food_recipes_app/food_recipes_app.dart';
import 'package:food_recipes_app/prefs/shared_preferences.dart';
// This is the test-2 branch
void main() async {
  bool isFirstTime = await isNewUser;
  AppRouter appRouter = AppRouter(isFirstTime: isFirstTime);

  runApp(
    FoodRecipesApp(
      appRouter: appRouter,
    ),
  );
}
