import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class FavouriteShimmerItem extends StatelessWidget {
  const FavouriteShimmerItem({super.key, this.baseColor, this.highlightColor});

  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Shimmer.fromColors(
        baseColor: baseColor ?? AppColors.grey,
        highlightColor: highlightColor ?? AppColors.white,
        child: Container(
          width: 160.w,
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          decoration: _getDecoration(),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
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
