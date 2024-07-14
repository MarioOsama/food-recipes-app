import 'package:food_recipes_app/core/models/recipe_item_model.dart';

abstract class RecipeState {}

final class RecipeInitial extends RecipeState {}

final class RecipeLoading extends RecipeState {}

final class RecipeSuccess extends RecipeState {
  RecipeSuccess(this.recipe, this.isFavorite);

  final RecipeItemModel recipe;
  final bool isFavorite;

  RecipeSuccess copyWith({
    RecipeItemModel? recipe,
    bool? isFavorite,
  }) {
    return RecipeSuccess(
      recipe ?? this.recipe,
      isFavorite ?? this.isFavorite,
    );
  }
}

final class RecipeError extends RecipeState {
  RecipeError(this.message);

  final String message;
}
