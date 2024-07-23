import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/widgets/custom_bottom.dart';
import 'package:food_recipes_app/features/Auth/logic/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/Auth/ui/widgets/custom_text_form_field.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomRegisterScreen extends StatefulWidget {
  const CustomRegisterScreen({super.key});

  @override
  State<CustomRegisterScreen> createState() => _CustomRegisterScreenState();
}

class _CustomRegisterScreenState extends State<CustomRegisterScreen> {
  final phoneController = TextEditingController();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is AuthRegisterLoading) {
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
      if (state is AuthRegisterSuccess) {
        Navigator.pop(context);
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
      if (state is AuthRegisterError) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: Text(
                'Register is Failed',
                style: AppTextStyles.font65WhiteRegular
                    .copyWith(fontSize: 20, color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * .08,
                child: CustomBottom(
                  text: 'Try Again',
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
                controller: nameController,
                labelName: 'Name',
                icon: Iconsax.user,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),
              verticalSpace(20),
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
              CustomBottom(
                  text: 'Register now',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<AuthCubit>().signUpAuth(
                          phoneController: phoneController,
                          nameController: nameController,
                          emailController: emailController,
                          passController: passwordController);
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
    phoneController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
