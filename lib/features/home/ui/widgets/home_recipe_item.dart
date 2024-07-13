import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';

class HomeRecipeItem extends StatelessWidget {
  const HomeRecipeItem(
      {super.key, required this.isFirst, required this.recipe});

  final bool isFirst;
  final RecipeItemModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.recipeDetails, arguments: recipe);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 220.w,
            height: 270.h,
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
            decoration: _getDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildItemTitle(),
                _buildSubtitle(),
              ],
            ),
          ),
          _buildItemImage(),
        ],
      ),
    );
  }

  Text _buildItemTitle() {
    return Text(
      recipe.title,
      style: AppTextStyles.font22BlackRegular,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Padding _buildItemImage() {
    return Padding(
      padding: EdgeInsets.only(bottom: 200.h),
      child: CircleAvatar(
        radius: 80.r,
        backgroundImage: NetworkImage(recipe.imageUrl),
      ),
    );
  }

  _buildSubtitle() {
    if (recipe.subtitle != null) {
      return Column(
        children: [
          SizedBox(height: 15.h),
          Text(
            recipe.subtitle!,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.font17OrangeRegular,
          )
        ],
      );
    }
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(30.r),
      border: isFirst
          ? Border.all(
              color: AppColors.black,
              width: 1,
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.1),
          blurRadius: 15.r,
          offset: const Offset(1, 10),
        ),
      ],
    );
  }
}
