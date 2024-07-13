import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_cubit.dart';

class SeeMoreHeaderListViewItem extends StatelessWidget {
  const SeeMoreHeaderListViewItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SeeMoreCubit>().getFoodFilteredData(title);
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.w),
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            20.r,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.font17BlackRegular,
        ),
      ),
    );
  }
}
