import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import 'widgets/reset_pass_view_body.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: ResetPassViewBody(),
    );
  }
}
