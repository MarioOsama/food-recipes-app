import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
