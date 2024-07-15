import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_bottom_nav_bar.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_recipe_items_bloc_builder.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_sections_button_row.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_slogan_and_search.dart';
import 'package:food_recipes_app/features/home/ui/widgets/see_more_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calling Data
    context.read<HomeCubit>().getHomeRecipes(5);
    // Setup UI widgets
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Padding(
        padding: EdgeInsets.only(top: 134.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 28.w, end: 50.w),
              child: const HomeSloganAndSearch(),
            ),
            SizedBox(height: 71.h),
            const HomeSectionsButtonRow(),
            SizedBox(height: 49.h),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 27.w),
              child: const SeeMoreButton(),
            ),
            SizedBox(height: 41.h),
            const HomeRecipeItemsBlocBuilder(),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
