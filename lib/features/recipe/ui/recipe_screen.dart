import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/features/recipe/logic/cubit/recipe_cubit.dart';
import 'package:food_recipes_app/features/recipe/logic/cubit/recipe_state.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_screen_shimmer.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_screen_body.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_screen_error.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key, required this.recipe});

  final RecipeItemModel recipe;

  @override
  Widget build(BuildContext context) {
    // Setup screen data
    context.read<RecipeCubit>().setupScreenData(recipe);
    return BlocBuilder<RecipeCubit, RecipeState>(
        buildWhen: (previous, current) =>
            current is RecipeLoading ||
            current is RecipeSuccess ||
            current is RecipeError,
        builder: (context, state) {
          switch (state) {
            case RecipeLoading():
              {
                return _setupLoading();
              }
            case RecipeSuccess():
              {
                return _setupSuccess(state.recipe);
              }
            case RecipeError():
              {
                return _setupError();
              }
            default:
              {
                return _setupLoading();
              }
          }
        });
  }

  Widget _setupSuccess(RecipeItemModel tragetedRecipe) {
    return RecipeScreenBody(
      recipe: tragetedRecipe,
    );
  }

  Widget _setupLoading() {
    return const RecipeScreenShimmer();
  }

  Widget _setupError() {
    return const RecipeScreenError();
  }
}
