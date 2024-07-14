import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/search/ui/widgets/app_search_list.dart';

class AppSearchBody extends StatelessWidget {
  const AppSearchBody({super.key, required this.meals});
  final List<Meals> meals;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightestGrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Column(children: [
        Text(
          'Found ${meals.length} results',
          style: AppTextStyles.font28BlackRegular,
        ),
        AppSearchList(
          meals: meals,
        ),
      ]),
    );
  }
}
