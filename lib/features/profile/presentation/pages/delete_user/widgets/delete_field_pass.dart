import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/features/profile/presentation/cubit/profile_cubit.dart';
import '../../../../../../core/validators/app_validators.dart';
import '../../../widgets/custom_text_filed.dart';

class DeleteFieldPass extends StatelessWidget {
  const DeleteFieldPass({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFiled(
      label: AppString.currentPassword.tr(),
      isPass: true,
      validator: AppValidators.checkPass,
      onSaved: (value) =>
          context.read<ProfileCubit>().changePassForDelete(value!),
    );
  }
}
