import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';


class AppFavouriteListItem extends StatelessWidget {
  const AppFavouriteListItem({super.key, required this.meal});
final Meals meal;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dismissible(
        onDismissed: (direction) {
          if(direction == DismissDirection.endToStart){
            
          }
        },
        key:  UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
         decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(20.r),
          ),          
          child: const Icon(Icons.delete, color: Colors.white,),
        ),
        child:  Container(
          height: 102.h,
          width: 340.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),          
          child:Row(
            children: [
            ClipRRect(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),bottomLeft: Radius.circular(20.r)),
              child: Image(
                image:  NetworkImage(
                  meal.strMealThumb,
                ),
                height: 120.h,
              ),
            ),
            horizontalSpace(20.w),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: 150.w,
                  child: Text(
                    meal.strMeal,
                    style: AppTextStyles.font17BlackRegular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              Text(
                meal.strArea,
                style: AppTextStyles.font15OrangeRegular.copyWith(height: 3.h),
              ),
            ],)
          ],), 
        ),
      ),
    );
  }
}
