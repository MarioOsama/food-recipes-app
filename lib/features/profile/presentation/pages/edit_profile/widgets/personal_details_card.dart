import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../data/models/m_user.dart';
import '../../../cubit/profile_cubit.dart';
import '../../../widgets/personal_info.dart';

class PersonalDetailsCard extends StatelessWidget {
  const PersonalDetailsCard({
    super.key,
    required this.image,
    required this.userData,
  });

  final File? image;
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
          ),
          child: GestureDetector(
            onTap: () {
              context.read<ProfileCubit>().pickImageFromGallery(context);
            },
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.lightGrey,
                  ),
                  child: image != null
                      ? Image.file(image!)
                      : Image.network(userData.userImage!),
                ),
                const SizedBox(
                  width: 10,
                ),
                PersonalInfo(userData: userData)
              ],
            ),
          ),
        )
      ],
    );
  }
}
