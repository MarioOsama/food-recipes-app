import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/networking/cocktail_api_services.dart';
import 'package:food_recipes_app/core/networking/dio_factory.dart';
import 'package:food_recipes_app/core/networking/food_api_services.dart';
import 'package:food_recipes_app/features/home/data/repos/home_repo.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<FoodApiServices>(() => FoodApiServices(dio));
  getIt.registerLazySingleton<CocktailApiServices>(
      () => CocktailApiServices(dio));

  // Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // Repos
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
