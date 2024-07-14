import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRecipeItem extends StatelessWidget {
  const ShimmerRecipeItem({super.key, this.baseColor, this.highlightColor});

  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Shimmer.fromColors(
            baseColor: baseColor ?? AppColors.grey,
            highlightColor: highlightColor ?? AppColors.white,
            child: Container(
              width: 160.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              decoration: _getDecoration(),
            ),
          ),
        ),
        _buildItemImage(),
      ],
    );
  }

  Padding _buildItemImage() {
    return Padding(
      padding: EdgeInsets.only(bottom: 110.h),
      child: Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.white,
        child: CircleAvatar(
          radius: 60.r,
        ),
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
