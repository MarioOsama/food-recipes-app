import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_recipe_item.dart';

class SeeMoreGridViewItem extends StatelessWidget {
  const SeeMoreGridViewItem({
    super.key,
    required this.recipe,
  });

  final RecipeItemModel recipe;

  @override
  Widget build(BuildContext context) {
    return HomeRecipeItem(
      isFirst: false,
      recipe: recipe,
    );
  }
}
