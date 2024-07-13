import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeYoutubeVideoButton extends StatelessWidget {
  const RecipeYoutubeVideoButton({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: GestureDetector(
          onTap: () {},
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
}
