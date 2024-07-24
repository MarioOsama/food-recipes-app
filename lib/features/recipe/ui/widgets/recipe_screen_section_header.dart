import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class RecipeScreenSectionHeader extends StatelessWidget {
  const RecipeScreenSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.h, start: 40.w),
        child: Text(
          title,
          style: AppTextStyles.font22BlackRegular,
        ),
      ),
    );
  }
}
