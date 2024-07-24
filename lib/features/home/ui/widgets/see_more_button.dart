import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_state.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onSeeMoreTap(context);
      },
      child: Text(
        AppString.seeMore.tr(),
        style: AppTextStyles.font15OrangeRegular,
      ),
    );
  }

  void _onSeeMoreTap(BuildContext context) {
    final HomeState currentHomeState = context.read<HomeCubit>().state;
    final String sectionName = currentHomeState is HomeFoodRecipesSuccess
        ? AppString.foods.tr()
        : AppString.cocktails.tr();
    context.pushNamed(AppRoutes.seeMore, arguments: sectionName);
  }
}
