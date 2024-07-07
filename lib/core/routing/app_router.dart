import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';

class AppRouter {
  final bool isFirstTime;
  const AppRouter({required this.isFirstTime});

  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('OnBoarding'),
            ),
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Home'),
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
