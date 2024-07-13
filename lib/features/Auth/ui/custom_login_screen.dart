import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/core/utils/spacing.dart';
import 'package:food_recipes_app/core/utils/widgets/custom_bottom.dart';
import 'package:food_recipes_app/features/Auth/ui/widgets/custom_text_form_field.dart';
import 'package:iconsax/iconsax.dart';

class CustomLoginScreen extends StatefulWidget {
  const CustomLoginScreen({super.key});

  @override
  State<CustomLoginScreen> createState() => _CustomLoginScreenState();
}

class _CustomLoginScreenState extends State<CustomLoginScreen> {
  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            verticalSpace(MediaQuery.of(context).size.height * 0.08),
            CustomTextFormField(
                isObscured: false,
                obscurePassword: false,
                labelName: 'Email address',
                icon: Iconsax.personalcard,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please Enter your Email ';
                  }
                  var emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return 'Please enter your real email address';
                  }
                  return null;
                },
                controller: emailController),
            verticalSpace(20),
            CustomTextFormField(
                isObscured: true,
                obscurePassword: true,
                labelName: 'Password',
                icon: Iconsax.password_check,
                validator: (value) {
                  if (value!.length < 8) {
                    return 'Password must be longer than 8 characters';
                  }
                  return null;
                },
                controller: passwordController),
            verticalSpace(7),
            Row(
              children: [
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password ?',
                      style: AppTextStyles.font22OrangeRegular
                          .copyWith(fontSize: 15),
                    ))
              ],
            ),
            const Expanded(child: SizedBox()),
            CustomBottom(
                text: 'Login now',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.preferences);
                })
          ],
        ),
      ),
    );
  }
}
