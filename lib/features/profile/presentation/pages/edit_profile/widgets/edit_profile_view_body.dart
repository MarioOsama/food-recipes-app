import 'package:flutter/material.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/user_data.dart';
import '../../profile/widgets/personal_details.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

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
            "My profile",
            style: AppTextStyles.font10BlackRegular.copyWith(fontSize: 34),
          ),
          const SizedBox(
            height: 20,
          ),
          const PersonalDetails(),
          const SizedBox(
            height: 50,
          ),
          const UserData(),
          const SizedBox(
            height: 60,
          ),
          const Row(
            children: [
              Expanded(
                  child: CustomBtn(
                      title: "Save Changes", color: AppColors.orange)),
            ],
          )
        ],
      ),
    );
  }
}
