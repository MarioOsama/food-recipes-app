import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? labelStyle;
  final String labelText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final StrutStyle? strutStyle;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.labelStyle,
    required this.labelText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller, this.strutStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorHeight: 20.h,
      strutStyle:strutStyle?? const StrutStyle(),
      cursorColor: AppColors.black,
      decoration: InputDecoration(
       alignLabelWithHint: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide:  BorderSide(
                color: AppColors.grey,
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide:  BorderSide(
                color: AppColors.grey,
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
        labelStyle: labelStyle ?? AppTextStyles.font17BlackRegular,
        labelText: labelText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? AppColors.grey,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font15BlackRegular,
      
      
     
      
   
    );
  }
}