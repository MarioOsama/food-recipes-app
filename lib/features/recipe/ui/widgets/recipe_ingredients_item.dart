import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class RecipeIngredientsItem extends StatelessWidget {
  const RecipeIngredientsItem(
      {super.key,
      required this.ingredientName,
      required this.ingredientAmount});

  final String ingredientName;
  final String ingredientAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: ListTile(
        minTileHeight: 10.h,
        horizontalTitleGap: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 4.h),
          child:
              const Icon(Icons.circle, size: 8, color: AppColors.darkestGrey),
        ),
        title: Text(
          ingredientName,
          style: AppTextStyles.font17DarkestGreyRegular,
        ),
        trailing: Text(
          _getIngredientAmount(),
          style: AppTextStyles.font17DarkestGreyRegular,
        ),
      ),
    );
  }

  String _getIngredientAmount() {
    return ingredientAmount.split(' ').first;
  }
}
