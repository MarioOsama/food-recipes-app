import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: ProfileViewBody(),
    );
  }
}
