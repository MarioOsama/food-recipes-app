import 'package:flutter/material.dart';

import '../../../../core/theming/app_text_styles.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
      child: Text(
        title,
        style: AppTextStyles.font65WhiteRegular.copyWith(fontSize: 18),
      ),
    );
  }
}
