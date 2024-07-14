import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_button.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_favourite_list_view.dart';

class AppFavouriteBody extends StatelessWidget {
  const AppFavouriteBody({super.key, required this.meals});
  final List<Meals> meals ;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      verticalSpace(50),
       AppFavouriteListView(meals: meals,),
      verticalSpace(30),
      AppButton(text: "Delete all items", onTap: () async {})
    ]);
  }
}
