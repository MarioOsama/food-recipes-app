import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/see_more_grid_veiw_bloc_builder.dart';

class SeeMoreItemsContainer extends StatelessWidget {
  const SeeMoreItemsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 34.h),
      decoration: BoxDecoration(
        color: AppColors.lightestGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: const SeeMoreGridViewBlocBuilder(),
    );
  }
}
