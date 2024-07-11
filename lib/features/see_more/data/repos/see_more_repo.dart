import 'package:food_recipes_app/core/networking/cocktail_api_services.dart';
import 'package:food_recipes_app/core/networking/food_api_services.dart';
import 'package:food_recipes_app/features/see_more/data/models/category_model.dart';

class SeeMoreRepo {
  final CocktailApiServices _cocktailApiServices;
  final FoodApiServices _foodApiServices;

  const SeeMoreRepo(this._cocktailApiServices, this._foodApiServices);

  // Food
  Future<FoodCategoriesResponseModel> getFoodCategoriesData() async {
    return await _foodApiServices.getCategoriesData();
  }

  // Cocktail
  Future<CocktailCategoriesResponseModel> getCocktailCategoriesData() async {
    return await _cocktailApiServices.getCategoriesData('list');
  }
}
