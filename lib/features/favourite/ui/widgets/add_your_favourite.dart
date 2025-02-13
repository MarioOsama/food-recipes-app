import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class AddYourFavourite extends StatelessWidget {
  const AddYourFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(50),
          Text(
            'Favourite'.tr(),
            style: AppTextStyles.font28BlackRegular,
          ),
          const Icon(
            Icons.favorite_border,
            size: 122,
            color: AppColors.darkGrey,
          ),
          Text(
            'Nothaveanyfavourites'.tr(),
            style: AppTextStyles.font28BlackRegular,
          ),
        ],
      ),
    );
  }
}
