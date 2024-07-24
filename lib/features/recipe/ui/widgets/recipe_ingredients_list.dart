import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_ingredients_item.dart';

class RecipeIngredientsList extends StatelessWidget {
  const RecipeIngredientsList(
      {super.key, required this.ingredients, required this.amounts});

  final List<String> ingredients;
  final List<String> amounts;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: RecipeIngredientsItem(
            ingredientName: ingredients[index],
            ingredientAmount: _getIngredientAmount(index),
          ),
        );
      },
    );
  }

  // To handle the case where the ingredients list is longer than the amounts list.
  String _getIngredientAmount(int index) {
    try {
      return amounts[index];
    } catch (e) {
      return '-';
    }
  }
}
