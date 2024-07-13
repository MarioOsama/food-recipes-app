import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 90.w),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.darkGrey.withOpacity(0.5),
                offset: const Offset(0, 10),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 120,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
