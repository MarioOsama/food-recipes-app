import 'package:bloc/bloc.dart';
import 'package:food_recipes_app/core/models/cocktail_response_model.dart';
import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/features/home/data/models/home_recipe_item_model.dart';
import 'package:food_recipes_app/features/home/data/repos/home_repo.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;

  // Home sections title
  final List<String> titles = ['Foods', 'Cocktails'];

  List<HomeRecipeItemModel> meals = [];

  List<HomeRecipeItemModel> cocktails = [];

  // Food recipes
  void showRandomFoodRecipes() {
    emit(HomeFoodRecipesSuccess(meals: meals));
  }

  // Cocktail recipes
  void showRandomCocktailRecipes() {
    emit(HomeCocktailRecipesSuccess(cocktails: cocktails));
  }

  /// Get [numberOfRecipes] random food and cocktail recipes
  void getHomeRecipes(int numberOfRecipes) async {
    for (int i = 0; i < numberOfRecipes; i++) {
      // Get and store the random food recipe
      final MealModel randomMeal = await _homeRepo.getRandomFoodRecipe();
      meals.add(
        HomeRecipeItemModel(
          title: randomMeal.name,
          subtitle: randomMeal.country,
          imageUrl: randomMeal.imageUrl,
        ),
      );
      // Get and store the random cocktail recipe
      final CocktailModel randomCocktail =
          await _homeRepo.getRandomCocktailRecipe();
      cocktails.add(
        HomeRecipeItemModel(
          title: randomCocktail.name,
          subtitle: randomCocktail.category,
          imageUrl: randomCocktail.imageUrl,
        ),
      );
    }
    showRandomFoodRecipes();
  }
}
