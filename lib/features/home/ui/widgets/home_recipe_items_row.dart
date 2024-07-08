import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_recipe_item.dart';

class HomeRecipeItemsRow extends StatelessWidget {
  const HomeRecipeItemsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: HomeRecipeItem(
            isFirst: index == 0,
          ),
        ),
      ),
    );
  }
}
