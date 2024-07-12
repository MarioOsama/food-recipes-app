import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.label,
      required this.initialValue,
      this.isPass = false,
      this.validator});
  final String label, initialValue;
  final bool isPass;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.lightestGrey));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.font15BlackRegular
              .copyWith(color: AppColors.darkGrey),
        ),
        TextFormField(
          initialValue: initialValue,
          validator: validator,
          obscureText: isPass,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            fillColor: AppColors.lightestGrey,
            filled: true,
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
          ),
        ),
      ],
    );
  }
}
