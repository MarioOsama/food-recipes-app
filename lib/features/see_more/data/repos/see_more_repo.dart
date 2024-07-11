import 'package:food_recipes_app/core/networking/cocktail_api_services.dart';
import 'package:food_recipes_app/core/networking/food_api_services.dart';

class SeeMoreRepo {
  final CocktailApiServices _cocktailApiServices;
  final FoodApiServices _foodApiServices;

  const SeeMoreRepo(this._cocktailApiServices, this._foodApiServices);
}
