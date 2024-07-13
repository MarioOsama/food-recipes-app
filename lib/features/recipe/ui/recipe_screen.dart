import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
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
  const RecipeScreen({super.key});

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
            const RecipeImage(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjAMLedZRk2kc2Gg7NC0jRaHIjxa1-vf-b_A&s',
            ),
            verticalSliverSpace(45),
            const RecipeCategoryContainer(
              categoryName: 'Burger',
            ),
            verticalSliverSpace(35),
            const RecipeTitleAndSubtitle(
              title: 'Burger with Fries',
              subtitle: 'American',
            ),
            verticalSliverSpace(40),
            const RecipeScreenSectionHeader(title: 'Ingredients'),
            const RecipeIngredientsList(
              ingredients: [
                'Burger Bun',
                'Beef Patty',
                'Cheese Slice',
                'Tomato Slice',
                'Lettuce Leaf',
                'Onion Slice',
                'Pickle',
                'tbsp Ketchup',
                'tbsp Mustard',
              ],
              amounts: [
                '2 pcs',
                '2 pcs',
                '2 pcs',
                '1 pcs',
                '2 pcs',
                '2 pcs',
                '1 pcs',
                '2 pcs',
                '2 pcs',
              ],
            ),
            verticalSliverSpace(40),
            const RecipeScreenSectionHeader(title: 'How to prepare'),
            const RecipeHowToPrepare(
              description:
                  'Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes. In a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil. Drain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.',
            ),
            const RecipeYoutubeVideoButton(
              videoUrl: 'https://www.youtube.com/watch?v=8QKoaG9cQf4',
            ),
          ],
        ),
      ),
    );
  }
}
