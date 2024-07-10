import 'package:food_recipes_app/core/models/cocktail_response_model.dart';
import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/core/networking/cocktail_api_services.dart';
import 'package:food_recipes_app/core/networking/food_api_services.dart';

class HomeRepo {
  const HomeRepo(this._foodApiServices, this._cocktailApiServices);

  final FoodApiServices _foodApiServices;
  final CocktailApiServices _cocktailApiServices;

  // Food services
  Future<MealModel> getRandomFoodRecipe() async {
    final FoodResponseModel responseData =
        await _foodApiServices.getRandomRecipeData();
    return responseData.meals.first;
  }

  // Cocktail services
  Future<CocktailModel> getRandomCocktailRecipe() async {
    final CocktailResponseModel responseData =
        await _cocktailApiServices.getRandomRecipeData();
    return responseData.cocktails.first;
  }
}
