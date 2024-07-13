import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/widgets/shimmer_recipe_item.dart';
import 'package:food_recipes_app/features/see_more/data/models/filtered_recipe_item_model.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_cubit.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_state.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/filtered_recipe_item.dart';

class SeeMoreGridViewBlocBuilder extends StatelessWidget {
  const SeeMoreGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeMoreCubit, SeeMoreState>(
        buildWhen: (previous, current) =>
            current is SeeMoreRecipesSuccess ||
            current is SeeMoreRecipesError ||
            current is SeeMoreRecipesLoading,
        builder: (context, state) {
          switch (state) {
            case SeeMoreRecipesLoading():
              {
                return _setupRecipesLoading();
              }
            case SeeMoreRecipesSuccess():
              {
                return _setupRecipesSuccess(state.recipes);
              }
            case SeeMoreRecipesError():
              {
                return _setupRecipesError(state.message);
              }
            default:
              {
                return _setupRecipesLoading();
              }
          }
        });
  }

  Widget _setupRecipesSuccess(List<FilteredRecipeItemModel> recipes) {
    return GridView.builder(
        padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.w,
          mainAxisSpacing: 35.h,
          childAspectRatio: 1 / 1.4,
        ),
        itemCount: recipes.length,
        itemBuilder: (ctx, index) {
          return FilteredRecipeItem(
            recipe: recipes[index],
          );
        });
  }

  Widget _setupRecipesError(String errorMessage) {
    return Center(child: Text(errorMessage));
  }

  Widget _setupRecipesLoading() {
    return GridView.builder(
        padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.w,
          mainAxisSpacing: 35.h,
          childAspectRatio: 1 / 1.4,
        ),
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return const ShimmerRecipeItem();
        });
  }
}
