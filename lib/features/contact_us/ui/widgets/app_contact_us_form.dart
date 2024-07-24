import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/features/contact_us/ui/widgets/app_text_field.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_button.dart';

class AppContactUsForm extends StatelessWidget {
  const AppContactUsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        verticalSpace(30),
      const  AppTextFormField(labelText: "Name",),
        verticalSpace(40),
      const  AppTextFormField(labelText: "Email",),
      verticalSpace(40),
      const  AppTextFormField(labelText: "Phone Number",),
     verticalSpace(40),
         AppTextFormField(labelText: "Feedback",strutStyle: StrutStyle(height: 10.h),),
        verticalSpace(40),
        AppButton(text: "Send",onTap: () {},),
      ]
    );
  }
}