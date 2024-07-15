// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/theming/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 30),
          child: Icon(
            Icons.chevron_left,
            size: 40,
          ),
        ),
        Text(
          title,
          style: AppTextStyles.font10BlackRegular.copyWith(fontSize: 34),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
