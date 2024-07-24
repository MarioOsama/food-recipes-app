import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/features/recipe/logic/cubit/recipe_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeYoutubeVideoButton extends StatelessWidget {
  const RecipeYoutubeVideoButton({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
        child: GestureDetector(
          onTap: () {
            _launchURL(context);
          },
          child: Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.red[600],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(BuildContext context) async {
    final Uri url = Uri.parse(videoUrl);
    if (!await launchUrl(url)) {
      context.read<RecipeCubit>().emitError('Could not launch this video');
    }
  }
}
