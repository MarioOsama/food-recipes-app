import 'package:food_recipes_app/core/models/cocktail_response_model.dart';
import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/core/networking/cocktail_api_services.dart';
import 'package:food_recipes_app/core/networking/food_api_services.dart';

class RecipeRepo {
  final FoodApiServices _foodApiServices;
  final CocktailApiServices _cocktailApiServices;

  RecipeRepo(this._foodApiServices, this._cocktailApiServices);

  // Food
  Future<MealModel> getFoodDataById(String id) async {
    final FoodResponseModel foodRecipeData = await _foodApiServices.getByID(id);
    return foodRecipeData.meals.first;
  }

  // Cocktail
  Future<CocktailModel> getCocktailDataById(String id) async {
    final CocktailResponseModel cocktailRecipeData =
        await _cocktailApiServices.getByID(id);
    return cocktailRecipeData.cocktails.first;
  }
}
