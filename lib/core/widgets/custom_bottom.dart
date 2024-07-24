import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class CustomBottom extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CustomBottom({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: MediaQuery.of(context).size.width*.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.font65WhiteRegular.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
