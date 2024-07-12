import 'package:flutter/material.dart';

import '../../../../core/validators/app_validators.dart';
import 'custom_text_filed.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextFiled(
          label: "User Name",
          initialValue: "Thelma Sara-bear",
          validator: AppValidators.isEmpty,
        ),
        SizedBox(
          height: 25,
        ),
        CustomTextFiled(
          label: "Email",
          initialValue: "thelma_sara-bear@gmail.com",
          validator: AppValidators.isEmail,
        ),
        SizedBox(
          height: 25,
        ),
        CustomTextFiled(
          label: "Phone Number",
          initialValue: "+233 54138989",
          validator: AppValidators.isEmpty,
        )
      ],
    );
  }
}
