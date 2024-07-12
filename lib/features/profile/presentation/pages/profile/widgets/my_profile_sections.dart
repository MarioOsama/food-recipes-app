import 'package:flutter/material.dart';

import 'my_profile_sections_card.dart';

class MyProfileSections extends StatelessWidget {
  const MyProfileSections({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> listTitle = [
      "Edit Profile",
      "Preferences",
      "Reset Password",
      "Contact Us"
    ];

    return Column(
        children: listTitle.map(
      (e) {
        return MyProfileSectionsCard(title: e);
      },
    ).toList());
  }
}
