import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/app_string.dart';
import '../../../../../../core/routing/app_routes.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../cubit/profile_cubit.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/user_data.dart';
import 'personal_details_edit_profile.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    await context.read<ProfileCubit>().getUserData();
  }

  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: keyForm,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * App Bar
              CustomAppBar(
                title: AppString.myProfile.tr(),
              ),
              // * Personal Details Edit Profile Section
              const PersonalDetailsEditProfile(),
              const SizedBox(
                height: 50,
              ),
              // * User Data (Have Name, phone, email of user )
              const UserData(),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                      child: BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is EditProfileSuccess) {
                        log("Profile Success");
                        Navigator.pop(context, AppRoutes.profile);
                      }
                      if (state is EditProfileFailure) {
                        log("Profile Failure");

                        // TODO :  AppSnackBar.snackBarError(msg: state.errMessage);
                      }
                    },
                    builder: (context, state) {
                      return CustomBtn(
                        isLoading: state is EditProfileLoading ? true : false,
                        title: AppString.saveChanges.tr(),
                        color: AppColors.orange,
                        onTap: () {
                          if (keyForm.currentState?.validate() ?? false) {
                            // ✅
                            log("validate ✅");
                            keyForm.currentState?.save();
                            log("save ✅");
                            context.read<ProfileCubit>().updateUserData();
                          }
                        },
                      );
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
