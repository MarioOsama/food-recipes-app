import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/contact_us/ui/widgets/app_contact_us_form.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical:30.h ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
               Text("Contact Us",style: AppTextStyles.font34BlackRegular,),
              verticalSpace(30),
              const AppContactUsForm(),
            ],
          ),
        ),
      ),
    );
  }
}
