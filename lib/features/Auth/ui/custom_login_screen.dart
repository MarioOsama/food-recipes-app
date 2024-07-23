import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/routing/app_routes.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/widgets/custom_bottom.dart';
import 'package:food_recipes_app/features/Auth/ui/widgets/custom_text_form_field.dart';
import 'package:food_recipes_app/feature/Auth/logic/auth_cubit.dart';
import 'package:food_recipes_app/feature/Auth/ui/widgets/custom_text_form_field.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: Text(
                'Login is Success',
                style: AppTextStyles.font65WhiteRegular
                    .copyWith(fontSize: 20, color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * .08,
                child: CustomBottom(
                  text: 'Lets Get Started',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                ),
              ),
            );
          },
        );
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
                'Login is Failed',
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
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.forgetPassword);
                      },
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
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<AuthCubit>(context).logInAuth(
                          emailController: emailController,
                          passwordController: passwordController);
                    }
                  }),
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
    });
  }
}
