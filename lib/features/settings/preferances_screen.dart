import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/core/widgets/custom_bottom.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  bool darkMode = false;
  String selectedLanguage = 'English';

  final List<String> languages = ['English', 'Arabic'];

  @override
  Widget build(BuildContext context) {
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
              child:
                  Text('Preferences', style: AppTextStyles.font34BlackRegular),
            ),
            verticalSpace(20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
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
                      Text('Dark Mode',
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
                width: MediaQuery.of(context).size.width * 0.85,
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
                child: CustomBottom(text: 'Save preferences', onPressed: () {}))
          ],
        ),
      ),
    );
  }
}
