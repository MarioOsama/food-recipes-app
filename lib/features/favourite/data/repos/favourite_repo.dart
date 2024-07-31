import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/network/api_result.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';
import 'package:food_recipes_app/core/prefs/shared_preferences.dart';

class FavouriteRepo {
  final MealApiService _mealApiService;
  FavouriteRepo(this._mealApiService);
  Future<ApiResult<MealsResponse>> getFavourite() async {
    try {
      List<Meals> favoriteMeals = [];
      for (String i in await getFavoritesIds()) {
        final response = await _mealApiService.getSearchById(i);
        favoriteMeals.addAll(response.meals);
      }

      return ApiResult.success(MealsResponse(meals: favoriteMeals));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
