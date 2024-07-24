import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import '../../../../../../core/theming/app_text_styles.dart';
import '../../../widgets/custom_app_bar.dart';
import 'custom_btn_delete_user_bloc_consumer.dart';
import 'delete_field_pass.dart';

class DeleteUserViewBody extends StatelessWidget {
  const DeleteUserViewBody({super.key});
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: keyForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * App Bar
            CustomAppBar(
              title: AppString.deleteProfile.tr(),
            ),
            const SizedBox(
              height: 150,
            ),
            // * Guidance message for the user
            Text(
              AppString.warningUser.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.font10BlackRegular.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            // * Custom Text Filed Password To verify the user  For Delete User Account
            const DeleteFieldPass(),
            const Expanded(child: SizedBox()),
            // * Custom Btn Delete User Bloc Consumer
            CustomBtnDeleteUserBlocConsumer(keyForm: keyForm),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
