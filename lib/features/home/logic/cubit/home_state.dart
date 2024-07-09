import 'package:food_recipes_app/features/home/data/models/home_recipe_item_model.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeFoodRecipesSuccess extends HomeState {
  HomeFoodRecipesSuccess({required this.meals});

  final List<HomeRecipeItemModel> meals;
}

final class HomeFoodRecipesLoading extends HomeState {}
