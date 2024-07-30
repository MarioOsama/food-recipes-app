import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/drink_response.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_favourite_list_item.dart';

class AppFavouriteListView extends StatelessWidget {
  const AppFavouriteListView(
      {super.key, required this.meals, required this.cocktails});
  final List<Meals> meals;
  final List<DrinksData> cocktails;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.68,
      child: ListView.separated(
        itemCount: meals.length,
        separatorBuilder: (context, index) => verticalSpace(20),
        itemBuilder: (context, index) => AppFavouriteListItem(
          cocktail: cocktails[index],
          meal: meals[index],
        ),
      ),
    );
  }
}
