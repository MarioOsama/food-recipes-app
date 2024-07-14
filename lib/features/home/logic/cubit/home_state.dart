import 'package:food_recipes_app/core/models/recipe_item_model.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeFoodRecipesSuccess extends HomeState {
  HomeFoodRecipesSuccess({required this.meals});

  final List<RecipeItemModel> meals;
}

final class HomeCocktailRecipesSuccess extends HomeState {
  HomeCocktailRecipesSuccess({required this.cocktails});

  final List<RecipeItemModel> cocktails;
}

final class HomeFoodRecipesLoading extends HomeState {}
