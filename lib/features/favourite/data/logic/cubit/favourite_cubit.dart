import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/models/drink_response.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/network/drinks_api_service.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';
import 'package:food_recipes_app/core/prefs/shared_preferences.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final MealApiService mealApiService;
  final DrinksApiServices drinksApiServices;
  FavouriteCubit(
    this.mealApiService,
    this.drinksApiServices,
  ) : super(const FavouriteState.initial());
  List<Meals> favouriteMeals = [];
  List<DrinksData> favouriteDrinks = [];

  Future<void> getFavouriteMeals() async {
    if (favouriteMeals.isNotEmpty && favouriteDrinks.isNotEmpty) return;
    emit(const FavouriteState.loading());
    try {
      for (String i in await getFavoritesIds()) {
        var response = await mealApiService.getSearchById(i);
        var responseCocktail = await drinksApiServices.getDrinkById(i);
        favouriteMeals.addAll(response.meals);
        favouriteDrinks.addAll(responseCocktail.drinks);
      }

      emit(FavouriteState.success(favouriteMeals, favouriteDrinks));
    } catch (e) {
      emit(FavouriteState.failure(e.toString()));
    }
  }

  Future<void> deleteFavorite(String id) async {
    await removeFavorite(id);
    favouriteMeals.removeWhere((element) => element.idMeal == id);
    favouriteDrinks.removeWhere((element) => element.idDrink == id);
  }

  Future<void> deleteAllFavorites() async {
    await removeAllFavorites();
    favouriteMeals.clear();
    favouriteDrinks.clear();
    await Future.delayed(
      const Duration(seconds: 1),
      () => emit(const FavouriteState.loading()),
    );
    emit(const FavouriteState.success([], []));
  }
}
