import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class RecipeCategoryContainer extends StatelessWidget {
  const RecipeCategoryContainer({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 35.h,
        width: double.infinity,
        color: AppColors.orange,
        alignment: Alignment.center,
        child: Text(
          categoryName,
          style: AppTextStyles.font18WhiteRegular,
        ),
      ),
    );
  }
}
