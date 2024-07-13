import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/di/dependency_injection.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/features/contact_us/ui/contact_us_screen.dart';
import 'package:food_recipes_app/features/favourite/ui/favourite_screen.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_cubit.dart';
import 'package:food_recipes_app/features/search/ui/search_screen.dart';

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
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SearchCubit>(),
                  child: const SearchScreen(),
                ));
      case AppRoutes.favorites:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      case AppRoutes.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());

      default:
        return null;
    }
  }
}
