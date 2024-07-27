import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_button.dart';
import '../../../../../../core/helpers/app_string.dart';
import '../../../../../../core/routing/app_routes.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../cubit/profile_cubit.dart';
import 'my_profile_sections.dart';
import 'personal_details_profile.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    //   await context.read<ProfileCubit>().signInWithEmailAndPassword();
    await context.read<ProfileCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * App Bar
            Text(
              AppString.myProfile.tr(),
              style: AppTextStyles.font28BlackRegular,
            ),
            // * Personal Details Profile Section
            verticalSpace(30),
            const PersonalDetailsProfile(),
            verticalSpace(20),
            // * My Profile Sections (Buttons For go To The My Profile Sections)
            const MyProfileSections(),
            // * Delete Profile Btn (For Go To The Delete Profile Page)
            verticalSpace(20),
            AppButton(
              text: AppString.deleteProfile.tr(),
              color: AppColors.red,
              onTap: () {
                context.pushNamed(AppRoutes.deleteUser);
              },
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
