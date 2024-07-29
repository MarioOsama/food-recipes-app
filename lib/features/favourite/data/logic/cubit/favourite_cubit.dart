import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/models/cocktail_response_model.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';
import 'package:food_recipes_app/core/networking/cocktail_api_services.dart';
import 'package:food_recipes_app/core/prefs/shared_preferences.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final MealApiService mealApiService;
  final CocktailApiServices cocktailApiServices;
  FavouriteCubit(this.mealApiService, this.cocktailApiServices)
      : super(const FavouriteState.initial());
  List<Meals> favouriteMeals = [];
  List<CocktailModel> favouriteCocktails = [];

  Future<void> getFavouriteMeals() async {
    if (favouriteMeals.isNotEmpty && favouriteCocktails.isNotEmpty) return;
    emit(const FavouriteState.loading());
    try {
      for (String i in await getFavoritesIds()) {
        var response = await mealApiService.getSearchById(i);
        var responseCocktail = await cocktailApiServices.getByID(i);
        favouriteMeals.addAll(response.meals);
        favouriteCocktails.addAll(responseCocktail.cocktails);
      }

      emit(FavouriteState.success(favouriteMeals, favouriteCocktails));
    } catch (e) {
      emit(FavouriteState.failure(e.toString()));
    }
  }

  Future<void> deleteFavorite(String id) async {
    await removeFavorite(id);
    favouriteMeals.removeWhere((element) => element.idMeal == id);
    favouriteCocktails.removeWhere((element) => element.id == id);
  }

  Future<void> deleteAllFavorites() async {
    await removeAllFavorites();
    favouriteMeals.clear();
    favouriteCocktails.clear();
    await Future.delayed(
      const Duration(seconds: 1),
      () => emit(const FavouriteState.loading()),
    );
    emit(const FavouriteState.success([], []));
  }
}
