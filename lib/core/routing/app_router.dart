import 'package:flutter/cupertino.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/features/Auth/ui/auth_screen.dart';
import 'package:food_recipes_app/features/initial/ui/get_started_screen.dart';
import 'package:food_recipes_app/features/recipe/ui/recipe_screen.dart';
import 'package:food_recipes_app/features/settings/preferances_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/di/dependency_injection.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:food_recipes_app/features/home/ui/home_screen.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_cubit.dart';
import 'package:food_recipes_app/features/see_more/ui/see_more_screen.dart';

class AppRouter {
  final bool isFirstTime;
  const AppRouter({required this.isFirstTime});

  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.getStarted:
        return MaterialPageRoute(
          builder: (context) => const GetStartedScreen(),
        );
      case AppRoutes.auth:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case AppRoutes.preferences:
        return MaterialPageRoute(
          builder: (context) => const PreferencesScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.recipeDetails:
        return MaterialPageRoute(
          builder: (_) => RecipeScreen(
            recipe: args as RecipeItemModel,
          ),
        );
      case AppRoutes.seeMore:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SeeMoreCubit>(),
            child: SeeMoreScreen(
              categoryName: args as String,
            ),
          ),
        );
      case AppRoutes.search:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Search'),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
