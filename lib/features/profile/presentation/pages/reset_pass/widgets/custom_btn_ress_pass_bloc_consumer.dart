import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/app_string.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../cubit/profile_cubit.dart';
import '../../../widgets/custom_btn.dart';

class CustomBtnRessPassBlocConsumer extends StatelessWidget {
  const CustomBtnRessPassBlocConsumer({
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
            if (state is ResetPasswordSuccess) {
              // * Success
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
              ));
              Navigator.pop(context);
            } else if (state is ResetPasswordFailure) {
              // * Fail
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg),
              ));
            }
          },
          builder: (context, state) {
            return CustomBtn(
              isLoading: state is ResetPasswordLoading ? true : false,
              title: AppString.saveChanges.tr(),
              color: AppColors.orange,
              onTap: () {
                if (keyForm.currentState?.validate() ?? false) {
                  log("validate ✅");
                  keyForm.currentState?.save();
                  log("save ✅");
                  // * reset Password Function
                  context.read<ProfileCubit>().resetPassword();
                }
              },
            );
          },
        )),
      ],
    );
  }
}
