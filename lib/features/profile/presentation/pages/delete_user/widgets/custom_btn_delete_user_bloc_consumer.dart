import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../cubit/profile_cubit.dart';
import '../../../widgets/custom_btn.dart';

class CustomBtnDeleteUserBlocConsumer extends StatelessWidget {
  const CustomBtnDeleteUserBlocConsumer({
    super.key,
    required this.keyForm,
  });

  final GlobalKey<FormState> keyForm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is DeleteUserSuccess) {
              // * Success
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
              ));
              Navigator.pop(context);
            } else if (state is DeleteUserFailure) {
              // * Fail
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
              ));
            }
          },
          builder: (context, state) {
            return CustomBtn(
              isLoading: state is DeleteUserLoading ? true : false,
              title: "Delete Profile",
              color: AppColors.red,
              onTap: () {
                if (keyForm.currentState?.validate() ?? false) {
                  log("validate ✅");
                  keyForm.currentState?.save();
                  log("save ✅");
                  // * Delete User Function
                  context.read<ProfileCubit>().deleteUser();
                }
              },
            );
          },
        )),
      ],
    );
  }
}
