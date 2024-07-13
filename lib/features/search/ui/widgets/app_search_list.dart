import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/features/search/ui/widgets/app_search_list_item.dart';

class AppSearchList extends StatelessWidget {
  const AppSearchList({super.key,required this.meals, });
final List<Meals> meals;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 35.h),
      child: SizedBox(
        height: MediaQuery .of(context).size.height * 0.66,
        child: ListView.separated(itemBuilder:(_,index){
          return  AppSearchListItem(meals: meals[index],);
        },
        separatorBuilder: (context, index) => verticalSpace(20.h),     
        itemCount: meals.length,
         ),
      ),
    );
  }
}