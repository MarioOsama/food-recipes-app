import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';
import 'package:food_recipes_app/features/favourite/data/repos/favourite_repo.dart';
import 'package:food_recipes_app/features/search/data/repos/meals_repo.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_cubit.dart';
import 'package:food_recipes_app/core/networking/cocktail_api_services.dart';
import 'package:food_recipes_app/core/networking/dio_factory.dart';
import 'package:food_recipes_app/core/networking/food_api_services.dart';
import 'package:food_recipes_app/features/home/data/repos/home_repo.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:food_recipes_app/features/recipe/data/repos/recipe_repo.dart';
import 'package:food_recipes_app/features/recipe/logic/cubit/recipe_cubit.dart';
import 'package:food_recipes_app/features/see_more/data/repos/see_more_repo.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<FoodApiServices>(() => FoodApiServices(dio));
  getIt.registerLazySingleton<CocktailApiServices>(
      () => CocktailApiServices(dio));
//search
  getIt.registerLazySingleton<MealApiService>(() => MealApiService(dio));
  getIt.registerLazySingleton<MealsRepo>(() => MealsRepo(getIt()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));

  // Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<SeeMoreCubit>(() => SeeMoreCubit(getIt()));
  getIt.registerFactory<RecipeCubit>(() => RecipeCubit(getIt()));

  // Repos
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(
        getIt(),
        getIt(),
      ));
  getIt.registerLazySingleton<SeeMoreRepo>(() => SeeMoreRepo(getIt(), getIt()));
  getIt.registerLazySingleton<RecipeRepo>(() => RecipeRepo(getIt(), getIt()));
// favourite
  getIt.registerLazySingleton<FavouriteRepo>(() => FavouriteRepo(getIt()));
}
