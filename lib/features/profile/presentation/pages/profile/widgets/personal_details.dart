import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_text_styles.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personal details",
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
              Container(
                width: 100,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.lightGrey,
                ),
                child: const Icon(
                  Icons.arrow_circle_up_rounded,
                  size: 60,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thelma Sara-bear",
                    style:
                        AppTextStyles.font10BlackRegular.copyWith(fontSize: 18),
                  ),
                  Text(
                    "thelma_sara-bear@gmail.com",
                    style: AppTextStyles.font10BlackRegular.copyWith(
                        fontSize: 13,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 200,
                    child: Divider(
                      color: AppColors.lightGrey,
                    ),
                  ),
                  Text(
                    "+233 54138989",
                    style: AppTextStyles.font10BlackRegular.copyWith(
                        fontSize: 13,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 200,
                    child: Divider(
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
