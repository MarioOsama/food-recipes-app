import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/see_more_header.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/see_more_items_container.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Padding(
        padding: EdgeInsets.only(top: 65.h),
        child: Column(
          children: [
            SizedBox(
              height: 45.h,
              child: const SeeMoreHeader(),
            ),
            SizedBox(height: 30.h),
            const Expanded(
              child: SeeMoreItemsContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
