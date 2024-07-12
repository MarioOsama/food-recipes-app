import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import 'widgets/edit_profile_view_body.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: EditProfileViewBody(),
    );
  }
}
