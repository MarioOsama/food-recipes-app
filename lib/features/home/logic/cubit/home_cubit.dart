import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/core/models/cocktail_response_model.dart';
import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/features/home/data/repos/home_repo.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;

  // Home sections title
  final List<String> titles = [AppString.foods.tr(), AppString.cocktails.tr()];

  List<RecipeItemModel> meals = [];

  List<RecipeItemModel> cocktails = [];

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
        RecipeItemModel(
          id: randomMeal.id,
          title: randomMeal.name,
          subtitle: randomMeal.country,
          imageUrl: randomMeal.imageUrl,
          category: randomMeal.category,
          steps: randomMeal.steps,
          ingredients: randomMeal.ingredientsList,
          measures: randomMeal.measuresList,
          youTubeVideoUrl: randomMeal.youTubeVideoUrl,
          tags: randomMeal.tags,
        ),
      );
      // Get and store the random cocktail recipe
      final CocktailModel randomCocktail =
          await _homeRepo.getRandomCocktailRecipe();
      cocktails.add(
        RecipeItemModel(
          id: randomCocktail.id,
          title: randomCocktail.name,
          subtitle: randomCocktail.category,
          imageUrl: randomCocktail.imageUrl,
          category: randomCocktail.category,
          steps: randomCocktail.steps,
          ingredients: randomCocktail.ingredientsList,
          measures: randomCocktail.measuresList,
          youTubeVideoUrl: randomCocktail.youTubeVideoUrl,
          tags: randomCocktail.tags,
          glass: randomCocktail.glass,
        ),
      );
    }
    showRandomFoodRecipes();
  }
}
