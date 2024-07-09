import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/core/networking/food_api_services.dart';

class HomeRepo {
  const HomeRepo(this._foodApiServices);

  final FoodApiServices _foodApiServices;

  Future<MealModel> getRandomFoodRecipe() async {
    final FoodResponseModel responseData =
        await _foodApiServices.getRandomRecipeData();
    return responseData.meals.first;
  }
}
