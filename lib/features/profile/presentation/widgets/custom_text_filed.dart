import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.label,
      this.initialValue,
      this.isPass = false,
      this.validator,
      this.onSaved,
      this.onChanged});
  final String? label, initialValue;
  final bool isPass;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.lightestGrey));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: AppTextStyles.font15BlackRegular
              .copyWith(color: AppColors.darkGrey),
        ),
        TextFormField(
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          obscureText: isPass,
          onSaved: onSaved,
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
