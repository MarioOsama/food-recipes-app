
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/network/api_result.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';

class FavouriteRepo {
  final MealApiService _mealApiService;

  FavouriteRepo(this._mealApiService);

  Future<ApiResult<MealsResponse>> getFavouriteMeals(String id) async {
    try {
      final response = await _mealApiService.getSearchById(id);

      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(e.toString());
    }
  }
}
