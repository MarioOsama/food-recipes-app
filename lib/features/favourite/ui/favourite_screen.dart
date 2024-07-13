import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_button.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_favourite_list_view.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text('Favourite',style:AppTextStyles.font17BlackRegular.copyWith(fontSize: 18.sp),),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(50),
const AppFavouriteListView(),
            verticalSpace(30),
            AppButton(text: "Delete all items",onTap: () {
             
           },),
          ]
        ),
      ),
    );
  }
}