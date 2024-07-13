import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/feature/Auth/logic/auth_cubit.dart';
import 'package:food_recipes_app/feature/Auth/ui/auth_screen.dart';
import 'package:food_recipes_app/feature/Auth/ui/forget_password_screen.dart';
import 'package:food_recipes_app/feature/initial/ui/get_started_screen.dart';
import 'package:food_recipes_app/feature/settings/preferances_screen.dart';

class AppRouter {
  final bool isFirstTime;
  const AppRouter({required this.isFirstTime});

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.getStarted:
        return CupertinoPageRoute(
          builder: (context) => const GetStartedScreen(),
        );
      case AppRoutes.auth:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => AuthCubit(), child: const AuthScreen()),
        );
      case AppRoutes.preferences:
        return CupertinoPageRoute(
          builder: (context) => const PreferencesScreen(),
        );
      case AppRoutes.forgetPassword:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => AuthCubit(),
              child: const ForgetPasswordScreen()),
        );
      default:
        return null;
    }
  }
}
