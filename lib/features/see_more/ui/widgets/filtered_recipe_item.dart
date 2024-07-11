import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/see_more/data/models/filtered_recipe_item_model.dart';

class FilteredRecipeItem extends StatelessWidget {
  const FilteredRecipeItem({super.key, required this.recipe});

  final FilteredRecipeItemModel recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Container(
            width: 160.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            decoration: _getDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildItemTitle(),
              ],
            ),
          ),
        ),
        _buildItemImage(),
      ],
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
      padding: EdgeInsets.only(bottom: 110.h),
      child: CircleAvatar(
        radius: 60.r,
        backgroundImage: NetworkImage(recipe.imageUrl),
        backgroundColor: AppColors.grey,
      ),
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(30.r),
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.05),
          blurRadius: 10.r,
          offset: const Offset(1, 5),
        ),
      ],
    );
  }
}
