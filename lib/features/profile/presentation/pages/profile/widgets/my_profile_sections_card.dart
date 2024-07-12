import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';

class MyProfileSectionsCard extends StatelessWidget {
  const MyProfileSectionsCard({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 70,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: AppTextStyles.font10BlackRegular.copyWith(fontSize: 18)),
          const Icon(
            Icons.chevron_right_sharp,
            size: 30,
          )
        ],
      ),
    );
  }
}
