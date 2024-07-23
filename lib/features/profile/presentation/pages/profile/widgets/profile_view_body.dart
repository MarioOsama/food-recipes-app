import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/app_string.dart';
import '../../../../../../core/routing/app_routes.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../cubit/profile_cubit.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_btn.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * App Bar
          CustomAppBar(
            title: AppString.myProfile.tr(),
          ),
          // * Personal Details Profile Section
          const Expanded(child: PersonalDetailsProfile()),
          const SizedBox(
            height: 20,
          ),
          // * My Profile Sections (Buttons For go To The My Profile Sections)
          const Expanded(flex: 2, child: MyProfileSections()),
          // * Delete Profile Btn (For Go To The Delete Profile Page)
          Row(
            children: [
              Expanded(
                  child: CustomBtn(
                title: AppString.deleteProfile.tr(),
                color: AppColors.red,
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.deleteUser);
                },
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
