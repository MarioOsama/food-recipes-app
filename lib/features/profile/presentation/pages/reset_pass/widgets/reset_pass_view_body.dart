import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import '../../../widgets/custom_app_bar.dart';
import 'custom_btn_ress_pass_bloc_consumer.dart';
import 'reset_password_data.dart';

class ResetPassViewBody extends StatelessWidget {
  const ResetPassViewBody({super.key});
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        key: keyForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * App Bar
            const CustomAppBar(
              title: "Reset Password",
            ),
            verticalSpace(20),
            // * Reset Password Data Field
            const ResetPasswordData(),
            const Expanded(child: SizedBox()),
            // * Custom Btn Reset Password Bloc Consumer
            CustomBtnRessPassBlocConsumer(keyForm: keyForm),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
