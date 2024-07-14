import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            // TODO: Add the logic to open the video in the youtube app.
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
}
