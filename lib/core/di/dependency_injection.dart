import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/network/dio_factory.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';
import 'package:food_recipes_app/features/search/data/repos/meals_repo.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{
Dio dio = DioFactory.getDio();

getIt.registerLazySingleton<MealApiService>(() => MealApiService(dio));
getIt.registerLazySingleton<MealsRepo>(() => MealsRepo(getIt()));
getIt.registerFactory<SearchCubit>(()=> SearchCubit(getIt()));
}
