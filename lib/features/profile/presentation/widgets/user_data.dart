import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/validators/app_validators.dart';
import '../../data/models/m_user_data_edit.dart';
import '../cubit/profile_cubit.dart';
import 'custom_text_filed.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataForEditModel userDataForModel =
        context.read<ProfileCubit>().userDataForEditModel;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Column(
            children: [
              CustomTextFiled(
                label: "User Name",
                initialValue: state.userData.userName!,
                validator: AppValidators.isEmpty,
                onSaved: userDataForModel.setUserName,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFiled(
                label: "Email",
                initialValue: state.userData.email!,
                onSaved: userDataForModel.setEmail,
                validator: AppValidators.isEmail,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFiled(
                label: "Phone Number",
                initialValue: state.userData.phone!,
                validator: AppValidators.isEmpty,
                onSaved: userDataForModel.setPhoneNum,
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}
