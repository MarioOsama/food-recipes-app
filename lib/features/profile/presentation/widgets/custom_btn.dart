import 'package:flutter/material.dart';

import '../../../../core/theming/app_text_styles.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.title,
    required this.color,
    this.onTap,
    this.isLoading = false,
  });
  final String title;
  final Color color;
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    title,
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyles.font65WhiteRegular.copyWith(fontSize: 18),
                  ),
          ),
        ));
  }
}
