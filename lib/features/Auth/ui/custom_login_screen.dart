import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/widgets/custom_bottom.dart';
import 'package:food_recipes_app/features/Auth/logic/auth_cubit.dart';
import 'package:food_recipes_app/features/Auth/ui/widgets/custom_text_form_field.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoginScreen extends StatefulWidget {
  const CustomLoginScreen({super.key});

  @override
  State<CustomLoginScreen> createState() => _CustomLoginScreenState();
}

class _CustomLoginScreenState extends State<CustomLoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is AuthLoginLoading) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: AppColors.orange,
                  size: 50,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            );
          },
        );
      }
      if (state is AuthLoginSuccess) {
        Navigator.pop(context);
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
      if (state is AuthLoginError) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: Text(
                AppString.loginFailed.tr(),
                style: AppTextStyles.font65WhiteRegular
                    .copyWith(fontSize: 20, color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * .08,
                child: CustomBottom(
                  text: AppString.tryAgain.tr(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        );
      }
    }, builder: (context, state) {
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
                  labelName: AppString.emailAddress.tr(),
                  icon: Iconsax.personalcard,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppString.enterValidEmail.tr();
                    }
                    var emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return AppString.enterValidEmail.tr();
                    }
                    return null;
                  },
                  controller: emailController),
              verticalSpace(20),
              CustomTextFormField(
                  isObscured: true,
                  obscurePassword: true,
                  labelName: AppString.password.tr(),
                  icon: Iconsax.password_check,
                  validator: (value) {
                    if (value!.length < 8) {
                      return AppString.enterCorrectPass.tr();
                    }
                    return null;
                  },
                  controller: passwordController),
              verticalSpace(7),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.forgetPassword);
                      },
                      child: Text(
                        AppString.forgetPassword.tr(),
                        style: AppTextStyles.font22OrangeRegular
                            .copyWith(fontSize: 15),
                      ))
                ],
              ),
              const Expanded(child: SizedBox()),
              CustomBottom(
                  text: AppString.login.tr(),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<AuthCubit>().logInAuth(
                          emailController: emailController,
                          passwordController: passwordController);
                    }
                  }),
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
