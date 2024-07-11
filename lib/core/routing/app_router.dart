import 'package:flutter/cupertino.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/feature/Auth/ui/auth_screen.dart';
import 'package:food_recipes_app/feature/initial/ui/get_started_screen.dart';
import 'package:food_recipes_app/feature/settings/preferances_screen.dart';

class AppRouter {
  final bool isFirstTime;
  const AppRouter({required this.isFirstTime});

  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.getStarted:
        return CupertinoPageRoute(builder: (context) => const GetStartedScreen(),);
      case AppRoutes.auth:
        return CupertinoPageRoute(builder: (context) => const AuthScreen(),);
      case AppRoutes.preferences:
        return CupertinoPageRoute(builder: (context) => const PreferencesScreen(),);
      default:
        return null;
    }
  }
}
