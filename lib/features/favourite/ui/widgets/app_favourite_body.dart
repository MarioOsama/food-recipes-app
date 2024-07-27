import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_button.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_favourite_list_view.dart';

class AppFavouriteBody extends StatelessWidget {
  const AppFavouriteBody({super.key, required this.meals});
  final List<Meals> meals;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(50),
            Text(
              'Favourite'.tr(),
              style: AppTextStyles.font28BlackRegular,
            ),
            AppFavouriteListView(
              meals: meals,
            ),
            verticalSpace(20),
            AppButton(text: "Deleteallitems".tr(), onTap: () async {})
          ],
        ),
      ),
    );
  }
}
