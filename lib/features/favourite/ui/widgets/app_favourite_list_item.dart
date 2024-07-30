import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/drink_response.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_cubit.dart';

class AppFavouriteListItem extends StatelessWidget {
  const AppFavouriteListItem(
      {super.key, required this.meal, required this.cocktail});
  final Meals meal;
  final DrinksData cocktail;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dismissible(
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            context
                .read<FavouriteCubit>()
                .deleteFavorite(meal.idMeal ?? cocktail.idDrink);
          }
        },
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: Container(
          height: 102.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r)),
                child: Image(
                  image: NetworkImage(
                    meal.strMealThumb ?? cocktail.strDrinkThumb,
                  ),
                  height: 120.h,
                ),
              ),
              horizontalSpace(20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 150.w,
                      child: Text(
                        meal.strMeal ?? cocktail.strDrink,
                        style: AppTextStyles.font17BlackRegular,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                  Text(
                    meal.strArea,
                    style:
                        AppTextStyles.font15OrangeRegular.copyWith(height: 3.h),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
