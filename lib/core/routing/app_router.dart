import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/di/dependency_injection.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';

import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:food_recipes_app/features/home/ui/home_screen.dart';
import 'package:food_recipes_app/features/profile/presentation/pages/delete_user/delete_user_view.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_cubit.dart';
import 'package:food_recipes_app/features/see_more/ui/see_more_screen.dart';

import '../../features/profile/presentation/pages/edit_profile/edit_profile_view.dart';
import '../../features/profile/presentation/pages/profile/profile_view.dart';
import '../../features/profile/presentation/pages/reset_pass/reset_pass_view.dart';

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
          builder: (_) => BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.seeMore:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SeeMoreCubit>(),
            child: const SeeMoreScreen(),
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
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );
      case AppRoutes.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfileView(),
        );
      case AppRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPassView(),
        );
      case AppRoutes.deleteUser:
        return MaterialPageRoute(
          builder: (_) => const DeleteUserView(),
        );
      default:
        return null;
    }
  }
}
