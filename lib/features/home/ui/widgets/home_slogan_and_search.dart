import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class HomeSloganAndSearch extends StatelessWidget {
  const HomeSloganAndSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.deliciousFood.tr(),
          style: AppTextStyles.font34BlackRegular,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            context.pushNamed(AppRoutes.search);
          },
          icon: const Icon(Icons.search),
          iconSize: 32.r,
          color: AppColors.black,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            context.pushNamed(AppRoutes.favorites);
          },
          icon: const Icon(Icons.favorite_border),
          iconSize: 32.r,
          color: AppColors.black,
        ),
      ],
    );
  }
}
