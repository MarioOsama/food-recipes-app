import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class StartSearch extends StatelessWidget {
  const StartSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       const   Icon( Icons.search_outlined, size: 122,color: AppColors.darkGrey,),
          Text('Start your search',style: AppTextStyles.font28BlackRegular,),
        ],
      ),
    );
  }
}