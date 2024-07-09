import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/features/home/data/models/home_recipe_item_model.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_recipe_item.dart';

class HomeRecipeItemsRow extends StatelessWidget {
  const HomeRecipeItemsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final recipesList = List.generate(
        5,
        (index) => HomeRecipeItemModel(
            title: 'Veggie tomato mix',
            imageUrl:
                'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=556,505',
            country: 'Italian'));

    return Row(
      children: _getRecipeItemsList(recipesList),
    );
  }

  // Generates a list of Widget items based on the provided list of HomeRecipeItemModel.
  List<Widget> _getRecipeItemsList(List<HomeRecipeItemModel> recipesList) {
    return List.generate(
      recipesList.length,
      (index) => Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: HomeRecipeItem(
          recipe: recipesList[index],
          isFirst: index == 0,
        ),
      ),
    );
  }
}
