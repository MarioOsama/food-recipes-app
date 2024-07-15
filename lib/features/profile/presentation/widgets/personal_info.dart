import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../data/models/m_user.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
    required this.userData,
  });

  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // * User Name
        Text(
          userData.userName!,
          style: AppTextStyles.font10BlackRegular.copyWith(fontSize: 18),
        ),
        Text(
          // * User Email Adders
          userData.email!,
          style: AppTextStyles.font10BlackRegular.copyWith(
              fontSize: 13,
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 200,
          child: Divider(
            color: AppColors.lightGrey,
          ),
        ),
        Text(
          // * User Phone Number
          userData.phone!,
          style: AppTextStyles.font10BlackRegular.copyWith(
              fontSize: 13,
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 200,
          child: Divider(
            color: AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
