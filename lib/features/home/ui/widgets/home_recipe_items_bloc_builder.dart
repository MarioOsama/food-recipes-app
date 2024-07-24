import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/core/widgets/shimmer_recipe_item.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_state.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_recipe_item.dart';

class HomeRecipeItemsBlocBuilder extends StatelessWidget {
  const HomeRecipeItemsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state) {
          case HomeFoodRecipesSuccess():
            {
              return _setupSuccess(state.meals);
            }
          case HomeCocktailRecipesSuccess():
            {
              return _setupSuccess(state.cocktails);
            }

          case HomeFoodRecipesLoading():
            {
              return _setupLoading();
            }
          default:
            {
              return _setupLoading();
            }
        }
      },
    );
  }

  // Generates a list of Widget items based on the provided list of HomeRecipeItemModel.
  List<Widget> _getRecipeItemsList(List<RecipeItemModel> recipesList) {
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

  _setupSuccess(List<RecipeItemModel> mealsModel) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _getRecipeItemsList(mealsModel),
        ),
      ),
    );
  }

  _setupLoading() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _getShimmerItems(),
        ),
      ),
    );
  }

  _getShimmerItems() {
    return List.generate(
      5,
      (index) => Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: const ShimmerRecipeItem(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
        ),
      ),
    );
  }
}
