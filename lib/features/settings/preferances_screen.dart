import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_button.dart';
import 'package:food_recipes_app/features/profile/presentation/widgets/custom_app_bar.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  bool darkMode = false;
  String selectedLanguage = AppString.english.tr();

  final List<String> languages = [
    AppString.english.tr(),
    AppString.arabic.tr()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: AppString.preferances.tr()),
            verticalSpace(20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.darkMode.tr(),
                          style: AppTextStyles.font17BlackRegular),
                      Switch(
                        value: darkMode,
                        onChanged: (value) {
                          setState(() {
                            darkMode = value;
                          });
                        },
                        activeColor: AppColors.orange,
                        inactiveTrackColor: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalSpace(20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Center(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: AppColors.white,
                      underline: const SizedBox(),
                      borderRadius: BorderRadius.zero,
                      style: AppTextStyles.font17BlackRegular,
                      value: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                      items: languages.map((language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Center(
                child: AppButton(
                    text: AppString.savePreferences.tr(), onTap: () {}))
          ],
        ),
      ),
    );
  }
}
