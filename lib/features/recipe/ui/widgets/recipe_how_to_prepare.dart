import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';

class RecipeHowToPrepare extends StatelessWidget {
  const RecipeHowToPrepare({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 55.w, end: 20.w),
        child: Text(
          description,
          style: TextStyle(
            fontSize: 17.sp,
            color: AppColors.darkestGrey,
          ),
        ),
      ),
    );
  }
}
