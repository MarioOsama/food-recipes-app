import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/see_more_header_list_view_bloc_builder.dart';

class SeeMoreHeader extends StatelessWidget {
  const SeeMoreHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String language = context.locale.languageCode;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            language == 'ar'
                ? Icons.keyboard_arrow_right_sharp
                : Icons.keyboard_arrow_left_sharp,
            size: 32.r,
            color: AppColors.black,
          ),
        ),
        SizedBox(width: 10.w),
        const Expanded(
          child: SeeMoreHeaderListViewBlocBuilder(),
        ),
      ],
    );
  }
}
