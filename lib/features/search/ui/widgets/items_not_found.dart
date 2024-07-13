import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class ItemsNotFound extends StatelessWidget {
  const ItemsNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       const   Icon( Icons.search_outlined, size: 122,color: AppColors.darkGrey,),
          Text('Item not found',style: AppTextStyles.font28BlackRegular,),
          SizedBox(width:220.w ,
            child: Text("Try searching the item with a different keyword.",style: AppTextStyles.font17BlackRegular.copyWith(color: AppColors.darkGrey,),textAlign: TextAlign.center,))
        ],
      ),
    );
  }
}