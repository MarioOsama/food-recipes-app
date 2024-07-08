import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class HomeRecipeItem extends StatelessWidget {
  const HomeRecipeItem({super.key, required this.isFirst});

  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 220.w,
          height: 270.h,
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
          decoration: _getDecoration(),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Veggie tomato mix',
                style: AppTextStyles.font22BlackRegular,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '35 minutes',
                style: AppTextStyles.font17OrangeRegular,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 200.h),
          child: Image.asset('assets/images/png/test-food-image.png'),
        ),
      ],
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(30.r),
      border: isFirst
          ? Border.all(
              color: AppColors.black,
              width: 1,
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.1),
          blurRadius: 20.r,
          offset: const Offset(5, 10),
          spreadRadius: 5,
        ),
      ],
    );
  }
}
