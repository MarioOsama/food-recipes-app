import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_cubit.dart';
import 'package:food_recipes_app/features/home/ui/widgets/home_section_button.dart';

class HomeSectionsButtonRow extends StatefulWidget {
  const HomeSectionsButtonRow({super.key});

  @override
  State<HomeSectionsButtonRow> createState() => _HomeSectionsButtonRowState();
}

class _HomeSectionsButtonRowState extends State<HomeSectionsButtonRow> {
  int _selectedIndex = 0;

  void _onSectionPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles = _getSectionButtonTitles();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _getButtonItemsList(titles),
    );
  }

  List<Widget> _getButtonItemsList(List<String> titles) {
    return List.generate(
      titles.length,
      (index) => HomeSectionButton(
          title: titles[index],
          isSelected: index == _selectedIndex,
          onPressed: () {
            _onSectionPressed(index);
            // context.read<HomeCubit>().getRandomFoodRecipes(5);
          }),
    );
  }

  List<String> _getSectionButtonTitles() {
    return context.read<HomeCubit>().titles;
  }
}
