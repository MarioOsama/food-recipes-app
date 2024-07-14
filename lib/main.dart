import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/di/dependency_injection.dart';
import 'package:food_recipes_app/core/routing/app_router.dart';
import 'package:food_recipes_app/food_recipes_app.dart';
import 'package:food_recipes_app/core/helpers/shared_preferences.dart';
import 'package:food_recipes_app/core/networking/firebase/firebase_options.dart';
import 'package:food_recipes_app/core/routing/app_router.dart';
import 'package:food_recipes_app/food_recipes_app.dart';
import 'package:food_recipes_app/core/prefs/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize dependency injection
  setupGetIt();
  // Check if the user is new
  bool isFirstTime = await isNewUser;
  AppRouter appRouter = AppRouter(isFirstTime: isFirstTime);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    FoodRecipesApp(
      appRouter: appRouter,
    ),
  );
}
