import 'package:flutter/material.dart';

import '../../../../../../core/validators/app_validators.dart';
import '../../../widgets/custom_text_filed.dart';

class ResetPasswordData extends StatelessWidget {
  const ResetPasswordData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // TODO : confirm pass
        CustomTextFiled(
          label: "Current Password",
          initialValue: "Thelma Sara-bear",
        ),
        SizedBox(
          height: 25,
        ),
        CustomTextFiled(
          label: "New Password",
          initialValue: "+233 54138989",
          isPass: true,
          validator: AppValidators.checkPass,
        ),
        SizedBox(
          height: 25,
        ),
        // TODO : confirm pass
        CustomTextFiled(
          label: "Re-New Password",
          initialValue: "+233 54138989",
          isPass: true,
        )
      ],
    );
  }
}
