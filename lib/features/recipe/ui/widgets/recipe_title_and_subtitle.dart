import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class RecipeTitleAndSubtitle extends StatelessWidget {
  const RecipeTitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyles.font28BlackRegular,
            ),
            SizedBox(height: 10.h),
            Text(
              subtitle,
              style: AppTextStyles.font22OrangeRegular,
            ),
          ],
        ),
      ),
    );
  }
}
