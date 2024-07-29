import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/di/dependency_injection.dart';
import 'package:food_recipes_app/core/routing/app_router.dart';
import 'package:food_recipes_app/firebase_options.dart';
import 'package:food_recipes_app/food_recipes_app.dart';
import 'package:food_recipes_app/core/prefs/shared_preferences.dart';

import 'core/simple_bloc_observer/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  // Initialize dependency injection
  await setupGetIt();
  // Check if the user is new
  Bloc.observer = SimpleBlocObserver();

  bool isFirstTime = await isNewUser;
  AppRouter appRouter = AppRouter(isFirstTime: isFirstTime);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      child: FoodRecipesApp(
        appRouter: appRouter,
      ),
    ),
  );
}
