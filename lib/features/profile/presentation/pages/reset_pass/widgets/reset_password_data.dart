import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/features/profile/presentation/cubit/profile_cubit.dart';
import '../../../../../../core/validators/app_validators.dart';
import '../../../widgets/custom_text_filed.dart';

class ResetPasswordData extends StatelessWidget {
  const ResetPasswordData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Current Password Text Form Filed
        CustomTextFiled(
          label: "Current Password",
          isPass: true,
          validator: AppValidators.checkPass,
          onSaved: (value) =>
              context.read<ProfileCubit>().changeOldPassword(value!),
        ),
        const SizedBox(
          height: 25,
        ),
        // * New Password Text Form Filed
        CustomTextFiled(
          label: "New Password",
          isPass: true,
          validator: AppValidators.checkPass,
          onChanged: (p0) => context.read<ProfileCubit>().changeCurrentPass(p0),
        ),
        const SizedBox(
          height: 25,
        ),
        // * Re-New Password Text Form Filed
        CustomTextFiled(
          label: "Re-New Password",
          isPass: true,
          validator: (value) => AppValidators.checkConfirmPass(
              value, context.read<ProfileCubit>().currentPass),
          onSaved: (value) =>
              context.read<ProfileCubit>().changeNewPassword(value!),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
