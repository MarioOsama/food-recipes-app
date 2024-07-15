import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/di/dependency_injection.dart';
import 'package:food_recipes_app/core/routing/app_router.dart';
import 'package:food_recipes_app/food_recipes_app.dart';
import 'package:food_recipes_app/core/prefs/shared_preferences.dart';

import 'core/simple_bloc_observer/simple_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize dependency injection
  setupGetIt();
  // Check if the user is new
  Bloc.observer = SimpleBlocObserver();

  bool isFirstTime = await isNewUser;
  AppRouter appRouter = AppRouter(isFirstTime: isFirstTime);
  runApp(
    FoodRecipesApp(
      appRouter: appRouter,
    ),
  );
}
