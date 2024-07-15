import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';

import '../../../../../../core/routing/app_routes.dart';
import '../../../../data/models/m_profile_sections.dart';
import 'my_profile_sections_card.dart';

class MyProfileSections extends StatelessWidget {
  const MyProfileSections({super.key});
  @override
  Widget build(BuildContext context) {
    List<ProfileSectionsModel> profileSectionsModel = [
      ProfileSectionsModel(
        title: "Edit Profile",
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.editProfile);
        },
      ),
      ProfileSectionsModel(
        title: "Preferences",
      ),
      ProfileSectionsModel(
        title: "Reset Password",
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.resetPassword);
        },
      ),
      ProfileSectionsModel(title: "Contact Us")
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
