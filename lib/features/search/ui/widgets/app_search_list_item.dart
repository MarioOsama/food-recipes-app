import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class AppSearchListItem extends StatelessWidget {
  const AppSearchListItem({super.key, required this.meals});
final Meals meals;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child:  Row(  
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),child: Image(image:  NetworkImage(meals.strMealThumb,),height:120.h,)),
          horizontalSpace(20.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 150.w,
                child: Text(meals.strMeal,style: AppTextStyles.font17BlackRegular,overflow: TextOverflow.ellipsis,maxLines: 1,)),

              Text(meals.strArea,style: AppTextStyles.font15OrangeRegular.copyWith(height: 3.h),),
            ]
          )
        ]
      ));
  }
}