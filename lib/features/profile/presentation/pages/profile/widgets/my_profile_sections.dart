import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import '../../../../../../core/helpers/app_string.dart';
import '../../../../../../core/routing/app_routes.dart';
import '../../../../data/models/m_profile_sections.dart';
import 'my_profile_sections_card.dart';

class MyProfileSections extends StatelessWidget {
  const MyProfileSections({super.key});
  @override
  Widget build(BuildContext context) {
    List<ProfileSectionsModel> profileSectionsModel = [
      ProfileSectionsModel(
        title: AppString.editProfile.tr(),
        onTap: () {
          context.pushNamed(AppRoutes.editProfile);
        },
      ),
      ProfileSectionsModel(
        title: AppString.preferences.tr(),
        onTap: () {
          context.pushNamed(AppRoutes.preferences);
        },
      ),
      ProfileSectionsModel(
        title: AppString.resetPassword.tr(),
        onTap: () {
          context.pushNamed(AppRoutes.resetPassword);
        },
      ),
      ProfileSectionsModel(
          title: AppString.contactUs.tr(),
          onTap: () {
            context.pushNamed(AppRoutes.contactUs);
          })
    ];

    return Column(
        children: profileSectionsModel.map(
      (e) {
        return MyProfileSectionsCard(
          title: e.title,
          onTap: e.onTap,
        );
      },
    ).toList());
  }
}
