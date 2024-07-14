import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String labelName;
  final IconData icon;
  bool obscurePassword = false;
  bool isObscured = false;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  CustomTextFormField({
    super.key,
    required this.controller,
    required this.isObscured,
    required this.labelName,
    required this.obscurePassword,
    required this.icon,
    this.validator,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.orange,
      obscureText: widget.obscurePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        suffixIcon: widget.isObscured == false
            ? Icon(widget.icon, color: AppColors.orange)
            : IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscurePassword = !widget.obscurePassword;
                  });
                },
                icon: widget.obscurePassword == true
                    ? const Icon(
                        Iconsax.eye_slash,
                        color: AppColors.orange,
                      )
                    : const Icon(
                        Iconsax.eye,
                        color: AppColors.orange,
                      ),
              ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.darkGrey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.grey)),
        labelText: widget.labelName,
        labelStyle: AppTextStyles.font17BlackRegular,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: widget.validator,
    );
  }
}
