import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/models/recipe_item_model.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_image.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_category_container.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_how_to_prepare.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_ingredients_list.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_screen_header.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_screen_section_header.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_title_and_subtitle.dart';
import 'package:food_recipes_app/features/recipe/ui/widgets/recipe_youtube_video_button.dart';

class RecipeScreenBody extends StatelessWidget {
  const RecipeScreenBody({
    super.key,
    required this.recipe,
  });

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
              subtitle: recipe.subtitle ?? '',
            ),
            verticalSliverSpace(40),
            RecipeScreenSectionHeader(title: AppString.ingredients.tr()),
            RecipeIngredientsList(
              ingredients: recipe.ingredients,
              amounts: recipe.measures,
            ),
            verticalSliverSpace(40),
            RecipeScreenSectionHeader(title: AppString.steps.tr()),
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
