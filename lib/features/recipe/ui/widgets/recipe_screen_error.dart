import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_screen_header.dart';

class RecipeScreenError extends StatelessWidget {
  const RecipeScreenError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightestGrey,
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: Column(
          children: [
            const RecipeScreenHeader(),
            verticalSpace(25),
            const Center(
              child: Text(
                'An error occurred while loading the recipe.',
                style: AppTextStyles.font28BlackRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
