import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_state.dart';


class FavouriteCubit extends Cubit<FavouriteState> {
  final MealApiService mealApiService;
  FavouriteCubit(this.mealApiService) : super(const FavouriteState.initial());
  List<Meals> favouriteMeals = [];
 List<int> ids = [52772,52771,52795,52956,52831];
  Future<void> getFavouriteMeals() async {
    emit(const FavouriteState.loading());
    try {
      for (int i in ids) {
        var response = await mealApiService.getSearchById(i);
        favouriteMeals.addAll(response.meals);
      }

      emit(FavouriteState.success(favouriteMeals));
    } catch (e) {
      emit(FavouriteState.failure(e.toString()));
    }
  }
 
}
