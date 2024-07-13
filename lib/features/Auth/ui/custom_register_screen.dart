import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/widgets/custom_bottom.dart';
import 'package:food_recipes_app/features/Auth/ui/widgets/custom_text_form_field.dart';
import 'package:iconsax/iconsax.dart';

class CustomRegisterScreen extends StatefulWidget {
  const CustomRegisterScreen({super.key});

  @override
  State<CustomRegisterScreen> createState() => _CustomRegisterScreenState();
}

class _CustomRegisterScreenState extends State<CustomRegisterScreen> {
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
              controller: phoneController,
              labelName: 'Phone number',
              icon: Iconsax.call,
              validator: (value) {
                String pattern = r'^(?:[+0][1-9]|0)[0-9]{8,12}$';
                RegExp regex = RegExp(pattern);
                if (!regex.hasMatch(value!)) {
                  return 'Enter your phone number';
                }
                return null;
              },
            ),
            verticalSpace(20),
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
            const Expanded(child: SizedBox()),
            CustomBottom(text: 'Register now', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
