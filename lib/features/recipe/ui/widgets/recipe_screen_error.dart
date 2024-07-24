import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

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
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left_sharp,
                  size: 32.r,
                  color: AppColors.black,
                ),
              ),
            ),
            verticalSpace(25),
            Center(
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
