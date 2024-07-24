import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/recipe/logic/cubit/recipe_cubit.dart';
import 'package:food_recipes_app/features/recipe/logic/cubit/recipe_state.dart';

class RecipeScreenHeader extends StatelessWidget {
  const RecipeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final String language = context.locale.languageCode;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                language == 'ar'
                    ? Icons.keyboard_arrow_right_sharp
                    : Icons.keyboard_arrow_left_sharp,
                size: 32.r,
                color: AppColors.black,
              ),
            ),
            const Spacer(),
            _buildFavIcon(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFavIcon(BuildContext context) {
    return BlocSelector<RecipeCubit, RecipeState, bool>(
      selector: (state) => (state as RecipeSuccess).isFavorite,
      builder: (context, isFavorite) {
        return IconButton(
          onPressed: () {
            _onFavoritePressed(context);
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 28.r,
            color: isFavorite ? AppColors.orange : AppColors.black,
          ),
        );
      },
    );
  }

  void _onFavoritePressed(BuildContext context) {
    final state = context.read<RecipeCubit>().state;
    if (state is RecipeSuccess) {
      context.read<RecipeCubit>().toggleFavorites(state.recipe.id);
    }
  }
}
