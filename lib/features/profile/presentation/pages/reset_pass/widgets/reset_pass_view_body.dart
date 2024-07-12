import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../widgets/custom_btn.dart';
import 'reset_password_data.dart';

class ResetPassViewBody extends StatelessWidget {
  const ResetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 30),
            child: Icon(
              Icons.chevron_left,
              size: 40,
            ),
          ),
          Text(
            "Reset Password",
            style: AppTextStyles.font10BlackRegular.copyWith(fontSize: 34),
          ),
          const ResetPasswordData(),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: SizedBox()),
          const Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CustomBtn(title: "Delete Profile", color: AppColors.red),
              )),
            ],
          )
        ],
      ),
    );
  }
}
