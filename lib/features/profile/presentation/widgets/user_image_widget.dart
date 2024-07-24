import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/app_colors.dart';
import '../../data/models/m_user.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    super.key,
    required this.userData,
  });
  final UserDataModel userData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.lightGrey,
      ),
      child: Image.network(
        // * User Image
        userData.userImage!,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            // * Shimmer Loading
            return Container(
              width: 100,
              height: 110,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.lightGrey,
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.white,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
