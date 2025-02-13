import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/Auth/logic/auth_cubit.dart';
import 'package:food_recipes_app/features/Auth/ui/widgets/custom_text_form_field.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_button.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final forgetPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgetPassLoading) {
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
        if (state is ForgetPassSuccess) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  AppString.sendLinkSuccess.tr(),
                  style: AppTextStyles.font65WhiteRegular
                      .copyWith(fontSize: 20, color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                  child: AppButton(
                    text: AppString.letStart.tr(),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, AppRoutes.auth);
                    },
                  ),
                ),
              );
            },
          );
        }
        if (state is ForgetPassError) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  AppString.sendLinkFailed.tr(),
                  style: AppTextStyles.font65WhiteRegular
                      .copyWith(fontSize: 20, color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                  child: AppButton(
                    text: AppString.tryAgain.tr(),
                    onTap: () => context.pop(),
                  ),
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.lightGrey,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded,
                      color: AppColors.black, size: 20),
                ),
                verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(AppString.forgetPassword.tr(),
                      style: AppTextStyles.font34BlackRegular),
                ),
                verticalSpace(20),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                          controller: forgetPassController),
                      verticalSpace(20),
                      Center(
                          child: AppButton(
                              text: AppString.sendLink.tr(),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context.read<AuthCubit>().forgotPassword(
                                      emailController: forgetPassController);
                                }
                              }))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
