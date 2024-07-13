import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/routing/app_router.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';

class FoodRecipesApp extends StatelessWidget {
  final AppRouter appRouter;
  const FoodRecipesApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.lightGrey,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.lightGrey
          ),
        ),
        initialRoute:
            appRouter.isFirstTime ? AppRoutes.onBoarding : AppRoutes.search,
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
      ),
    );
  }
}
