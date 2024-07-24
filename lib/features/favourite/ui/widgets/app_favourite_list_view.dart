import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_favourite_list_item.dart';

class AppFavouriteListView extends StatelessWidget {
  const AppFavouriteListView({super.key, required this.meals});
final List<Meals> meals ;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.separated(
        itemCount: meals.length,
        separatorBuilder: (context, index) => verticalSpace(20),
        itemBuilder: (context, index) =>  AppFavouriteListItem(meal: meals[index],),
      ),
    );
  }
}