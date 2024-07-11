import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/see_more_grid_view_item.dart';

class SeeMoreGridView extends StatelessWidget {
  const SeeMoreGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 40.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 35.w,
        childAspectRatio: 1 / 2.1,
      ),
      itemCount: 10,
      itemBuilder: (ctx, index) {
        return SeeMoreGridViewItem(
          recipe: RecipeItemModel(
            title: 'title',
            imageUrl:
                'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg',
            subtitle: 'subtitle',
          ),
        );
      },
    );
  }
}
