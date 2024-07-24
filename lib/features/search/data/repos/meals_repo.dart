import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/network/api_result.dart';
import 'package:food_recipes_app/core/network/meal_api_service.dart';



class MealsRepo {
  final MealApiService _mealApiService;

  MealsRepo(this._mealApiService);

  Future<ApiResult<MealsResponse>> getMeals(String query) async {
    try{
final response = await _mealApiService.getSearch(query);

return ApiResult.success(response);
    }catch(e){
return ApiResult.failure(e.toString());
    }
  }
    
  }
