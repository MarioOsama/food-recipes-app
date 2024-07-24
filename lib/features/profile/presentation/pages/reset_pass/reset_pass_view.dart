import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/features/profile/presentation/cubit/profile_cubit.dart';
import '../../../../../core/theming/app_colors.dart';
import 'widgets/reset_pass_view_body.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: BlocProvider(
        create: (context) => ProfileCubit(),
        child: const ResetPassViewBody(),
      ),
    );
  }
}
