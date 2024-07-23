import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';


class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, this.onSubmitted});
 
 final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        style: TextStyle(
          height: 1.h,
        ),
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Search'.tr(),
          hintStyle: AppTextStyles.font15DarkGreyRegular,
          prefixIcon:const Icon(Icons.search),
          fillColor: AppColors.lightGrey,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.r)),
              borderSide:const BorderSide(
                color: AppColors.darkGrey,
                width: 2,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.r)),
              borderSide: BorderSide(
                color: AppColors.orange,
                width: 2.w,
              )),
        ),
      ),
    );
  }
}
