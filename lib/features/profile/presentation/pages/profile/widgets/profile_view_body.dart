import 'package:flutter/material.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../widgets/custom_btn.dart';
import 'my_profile_sections.dart';
import 'personal_details.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

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
            height: 20,
          ),
          const MyProfileSections(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Expanded(
                  child:
                      CustomBtn(title: "Delete Profile", color: AppColors.red)),
            ],
          )
        ],
      ),
    );
  }
}
