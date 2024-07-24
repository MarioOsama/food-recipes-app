import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, this.onTap});
  final String text;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: 70.h,
        width: 314.w,
        decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              AppTextStyles.font17BlackRegular.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
