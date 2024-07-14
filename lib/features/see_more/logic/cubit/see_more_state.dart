import 'package:food_recipes_app/features/see_more/data/models/category_model.dart';
import 'package:food_recipes_app/features/see_more/data/models/filtered_recipe_item_model.dart';

abstract class SeeMoreState {}

final class SeeMoreInitial extends SeeMoreState {}

// Categories
final class SeeMoreCategoriesLoading extends SeeMoreState {}

final class SeeMoreCategoriesSuccess extends SeeMoreState {
  SeeMoreCategoriesSuccess(this.categories);

  final List<CategoryModel> categories;
}

final class SeeMoreCategoriesError extends SeeMoreState {
  SeeMoreCategoriesError(this.message);

  final String message;
}

// Recipes
final class SeeMoreRecipesLoading extends SeeMoreState {}

final class SeeMoreRecipesSuccess extends SeeMoreState {
  SeeMoreRecipesSuccess(this.recipes);

  final List<FilteredRecipeItemModel> recipes;
}

final class SeeMoreRecipesError extends SeeMoreState {
  SeeMoreRecipesError(this.message);

  final String message;
}
