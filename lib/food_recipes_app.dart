import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/routing/app_router.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';

class FoodRecipesApp extends StatelessWidget {
  final AppRouter appRouter;
  const FoodRecipesApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Recipes',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute:
            appRouter.isFirstTime ? AppRoutes.getStarted : AppRoutes.getStarted,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
