import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/core/app_assets/app_assets.dart';
import 'package:food_recipes_app/features/Auth/ui/custom_login_screen.dart';
import 'package:food_recipes_app/features/Auth/ui/custom_register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(AppAssets.appLogo),
          toolbarHeight: MediaQuery.of(context).size.height * 0.25,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Login'),
              Tab(text: 'Register'),
            ],
            labelStyle: AppTextStyles.font17BlackRegular,
            dividerColor: Colors.transparent,
            indicator: const UnderlineTabIndicator(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              borderSide: BorderSide(width: 2.0, color: AppColors.orange),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: CustomLoginScreen()),
            Center(child: CustomRegisterScreen()),
          ],
        ),
      ),
    );
  }
}
