import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

class SeeMoreHeaderListViewItemShimmer extends StatelessWidget {
  const SeeMoreHeaderListViewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      child: Container(
        margin: EdgeInsets.only(right: 20.w),
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            20.r,
          ),
        ),
        child: Text(
          'title',
          style: AppTextStyles.font17BlackRegular,
        ),
      ),
    );
  }
}
