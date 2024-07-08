import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/routing/app_router.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
// Test Two branch
class FoodRecipesApp extends StatelessWidget {
  final AppRouter appRouter;
  const FoodRecipesApp({super.key, required this.appRouter});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute:
          appRouter.isFirstTime ? AppRoutes.onBoarding : AppRoutes.home,
      onGenerateRoute: appRouter.onGenerateRoute,
      title: 'Food Recipes',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Food Recipes'),
        ),
        body: const Center(
          child: Text('Welcome to Food Recipes!'),
        ),
      ),
    );
  }
}
