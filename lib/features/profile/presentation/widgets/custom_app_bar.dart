// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';

import '../../../../core/theming/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(
              Icons.chevron_left,
              size: 32,
            ),
          ),
          horizontalSpace(20),
          Text(
            title,
            style: AppTextStyles.font28BlackRegular,
          ),
        ],
      ),
    );
  }
}
