import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:food_recipes_app/features/profile/presentation/widgets/personal_info.dart';
import '../../../../../../core/helpers/app_string.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../widgets/custom_loading.dart';
import '../../../widgets/user_image_widget.dart';

class PersonalDetailsProfile extends StatefulWidget {
  const PersonalDetailsProfile({super.key});

  @override
  State<PersonalDetailsProfile> createState() => _PersonalDetailsProfileState();
}

class _PersonalDetailsProfileState extends State<PersonalDetailsProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.personalDetails.tr(),
                style: AppTextStyles.font10BlackRegular.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: Row(
                  children: [
                    // * Custom Network Image with Loading
                    UserImageWidget(
                      userData: state.userData,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // * PersonalInfo (Have Name, phone, email of user )
                    PersonalInfo(userData: state.userData)
                  ],
                ),
              )
            ],
          );
        }
        // * Custom Loading
        return const CustomLoading();
      },
    );
  }
}
