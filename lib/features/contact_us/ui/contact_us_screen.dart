import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/features/contact_us/ui/widgets/app_contact_us_form.dart';
import 'package:food_recipes_app/features/profile/presentation/widgets/custom_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: AppString.contactUs.tr()),
              const AppContactUsForm(),
            ],
          ),
        ),
      ),
    );
  }
}
