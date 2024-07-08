import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class HomeSectionButton extends StatelessWidget {
  const HomeSectionButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onPressed});

  final String title;
  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 87.w,
      alignment: Alignment.center,
      decoration: _getBoxDecoration(isSelected),
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: _getTextStyle(isSelected),
          ),
        ),
      ),
    );
  }

  // Get BoxDecoration based on the button is selected or not
  _getBoxDecoration(bool isSelected) {
    return BoxDecoration(
      border: isSelected
          ? const Border(
              bottom: BorderSide(
                color: AppColors.orange,
                width: 3.0,
              ),
            )
          : null,
    );
  }

  // Get TextStyle based on the button is selected or not
  TextStyle _getTextStyle(bool isSelected) {
    if (isSelected) {
      return AppTextStyles.font17OrangeRegular;
    } else {
      return AppTextStyles.font17DarkestGreyRegular;
    }
  }
}
