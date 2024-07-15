import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/core/models/cocktail_response_model.dart';
import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/features/recipe/data/repos/recipe_repo.dart';
import 'package:food_recipes_app/features/recipe/logic/cubit/recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(this._recipeRepo) : super(RecipeInitial());

  final RecipeRepo _recipeRepo;

  void setupScreenData(RecipeItemModel recipe) async {
    // If the received recipe data not completed (From SeeMore screen)
    final bool isFavorite = await checkIfRecipeIsFavorite(recipe.id);
    if (recipe.section != null) {
      emit(RecipeLoading());
      try {
        final RecipeItemModel recipeData = await getRecipeDataById(recipe);
        emit(RecipeSuccess(recipeData, isFavorite));
      } catch (e) {
        emit(RecipeError(e.toString()));
      }
      // If the received recipe data is completed (From Home screen)
    } else {
      emit(RecipeSuccess(recipe, isFavorite));
    }
  }

  // Fetch data by id
  Future<RecipeItemModel> _getFoodDataById(String id) async {
    final MealModel meal = await _recipeRepo.getFoodDataById(id);
    return RecipeItemModel(
      id: meal.id,
      title: meal.name,
      imageUrl: meal.imageUrl,
      category: meal.category,
      steps: meal.steps,
      ingredients: meal.ingredientsList,
      measures: meal.measuresList,
      subtitle: meal.country,
      tags: meal.tags,
      youTubeVideoUrl: meal.youTubeVideoUrl,
    );
  }

  Future<RecipeItemModel> _getCocktailDataById(String id) async {
    final CocktailModel cocktail = await _recipeRepo.getCocktailDataById(id);
    return RecipeItemModel(
      id: cocktail.id,
      title: cocktail.name,
      imageUrl: cocktail.imageUrl,
      category: cocktail.category,
      steps: cocktail.steps,
      ingredients: cocktail.ingredientsList,
      measures: cocktail.measuresList,
      subtitle: cocktail.alcoholic,
      tags: cocktail.tags,
      youTubeVideoUrl: cocktail.youTubeVideoUrl,
      glass: cocktail.glass,
    );
  }

  Future<RecipeItemModel> getRecipeDataById(RecipeItemModel recipe) async {
    if (recipe.section == AppString.foods.tr()) {
      return await _getFoodDataById(recipe.id);
    } else {
      return await _getCocktailDataById(recipe.id);
    }
  }

  // Favorites
  void toggleFavorites(String recipeId) async {
    final List<String> favorites =
        await _recipeRepo.getFavoritesFromSharedPrefs();
    if (favorites.contains(recipeId)) {
      await _recipeRepo.removeRecipeFromSharedPrefs(recipeId);
    } else {
      await _recipeRepo.saveRecipeToSharedPrefs(recipeId);
    }
    final List<String> updatedFavorites =
        await _recipeRepo.getFavoritesFromSharedPrefs();
    emit((state as RecipeSuccess)
        .copyWith(isFavorite: updatedFavorites.contains(recipeId)));
  }

  Future<bool> checkIfRecipeIsFavorite(String recipeId) async {
    final List<String> favorites =
        await _recipeRepo.getFavoritesFromSharedPrefs();
    final bool isFavorite = favorites.contains(recipeId);
    return isFavorite;
  }

  // Error handling
  void emitError(String message) {
    emit(RecipeError(message));
  }
}
