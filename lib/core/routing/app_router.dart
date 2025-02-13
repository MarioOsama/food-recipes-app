import 'package:flutter/cupertino.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/features/Auth/logic/auth_cubit.dart';
import 'package:food_recipes_app/features/Auth/ui/auth_screen.dart';
import 'package:food_recipes_app/features/Auth/ui/forget_password_screen.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_cubit.dart';
import 'package:food_recipes_app/features/initial/ui/get_started_screen.dart';
import 'package:food_recipes_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:food_recipes_app/features/recipe/logic/cubit/recipe_cubit.dart';
import 'package:food_recipes_app/features/recipe/ui/recipe_screen.dart';
import 'package:food_recipes_app/features/settings/preferances_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/di/dependency_injection.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/features/contact_us/ui/contact_us_screen.dart';
import 'package:food_recipes_app/features/favourite/ui/favourite_screen.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_cubit.dart';
import 'package:food_recipes_app/features/search/ui/search_screen.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:food_recipes_app/features/home/ui/home_screen.dart';
import 'package:food_recipes_app/features/profile/presentation/pages/delete_user/delete_user_view.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_cubit.dart';
import 'package:food_recipes_app/features/see_more/ui/see_more_screen.dart';
import 'package:food_recipes_app/main_screen.dart';

import '../../features/profile/presentation/pages/edit_profile/edit_profile_view.dart';
import '../../features/profile/presentation/pages/profile/profile_view.dart';
import '../../features/profile/presentation/pages/reset_pass/reset_pass_view.dart';

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
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const AuthScreen(),
          ),
        );
      case AppRoutes.mainScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<HomeCubit>(
                create: (context) => getIt<HomeCubit>(),
              ),
              BlocProvider<FavouriteCubit>(
                create: (context) => FavouriteCubit(getIt()),
              ),
              BlocProvider<ProfileCubit>(
                create: (context) => getIt<ProfileCubit>(),
              ),
            ],
            child: const MainScreen(),
          ),
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
          builder: (_) => BlocProvider<RecipeCubit>(
            create: (context) => getIt<RecipeCubit>(),
            child: RecipeScreen(
              recipe: args as RecipeItemModel,
            ),
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
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SearchCubit>(),
                  child: const SearchScreen(),
                ));
      case AppRoutes.favorites:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      case AppRoutes.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case AppRoutes.forgetPassword:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgetPasswordScreen(),
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
