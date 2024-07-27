import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';
import 'package:food_recipes_app/core/prefs/shared_preferences.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final MealApiService mealApiService;
  FavouriteCubit(this.mealApiService) : super(const FavouriteState.initial());
  List<Meals> favouriteMeals = [];

  Future<void> getFavouriteMeals() async {
    if (favouriteMeals.isNotEmpty) return;
    emit(const FavouriteState.loading());
    try {
      for (String i in await getFavoritesIds()) {
        var response = await mealApiService.getSearchById(i);
        favouriteMeals.addAll(response.meals);
      }

      emit(FavouriteState.success(favouriteMeals));
    } catch (e) {
      emit(FavouriteState.failure(e.toString()));
    }
  }

  Future<void> deleteFavorite(String id) async {
    await removeFavorite(id);
    favouriteMeals.removeWhere((element) => element.idMeal == id);
  }

  Future<void> deleteAllFavorites(BuildContext context) async {
    await removeAllFavorites();
    favouriteMeals.clear();
    await Future.delayed(
      const Duration(seconds: 1),
      () => emit(const FavouriteState.loading()),
    );
    emit(const FavouriteState.success([]));
  }
}
