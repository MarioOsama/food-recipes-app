import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/shimmer_item.dart';

class RecipeScreenShimmer extends StatelessWidget {
  const RecipeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightestGrey,
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
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
            verticalSpace(30),
            const ShimmerItem(width: 200, height: 200, isCircular: true),
            verticalSpace(50),
            const ShimmerItem(
                width: double.infinity, height: 35, isCircular: false),
            verticalSpace(35),
            const ShimmerItem(width: 200, height: 25, isCircular: false),
            verticalSpace(10),
            const ShimmerItem(width: 100, height: 25, isCircular: false),
            verticalSpace(70),
            const Align(
              alignment: Alignment.centerLeft,
              child: ShimmerItem(width: 100, height: 25, isCircular: false),
            ),
            verticalSpace(35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: ShimmerItem(
                  width: double.infinity, height: 10, isCircular: false),
            ),
          ],
        ),
      ),
    );
  }
}
