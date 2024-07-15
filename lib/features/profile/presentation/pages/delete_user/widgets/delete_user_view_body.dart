import 'package:flutter/material.dart';
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
            const CustomAppBar(
              title: "Delete Profile",
            ),
            const SizedBox(
              height: 150,
            ),
            // * Guidance message for the user
            Text(
              "Are you sure you want to delete your account? This process cannot be undone.",
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
