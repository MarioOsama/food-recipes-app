import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_category_container.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_how_to_prepare.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_ingredients_list.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_screen_header.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_image.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_screen_section_header.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_title_and_subtitle.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_youtube_video_button.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key, required this.recipe});

  final RecipeItemModel recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightestGrey,
      body: Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: CustomScrollView(
          slivers: [
            const RecipeScreenHeader(),
            verticalSliverSpace(25),
            RecipeImage(
              imageUrl: recipe.imageUrl,
            ),
            verticalSliverSpace(45),
            RecipeCategoryContainer(
              categoryName: recipe.category,
            ),
            verticalSliverSpace(35),
            RecipeTitleAndSubtitle(
              title: recipe.title,
              subtitle: recipe.subtitle!,
            ),
            verticalSliverSpace(40),
            const RecipeScreenSectionHeader(title: 'Ingredients'),
            RecipeIngredientsList(
              ingredients: recipe.ingredients,
              amounts: recipe.measures,
            ),
            verticalSliverSpace(40),
            const RecipeScreenSectionHeader(title: 'How to prepare'),
            RecipeHowToPrepare(
              description: recipe.steps,
            ),
            verticalSliverSpace(30),
            if (recipe.youTubeVideoUrl != null)
              RecipeYoutubeVideoButton(
                videoUrl: recipe.youTubeVideoUrl!,
              ),
          ],
        ),
      ),
    );
  }
}
