import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/extensions.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_cubit.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_state.dart';
import 'package:food_recipes_app/features/search/ui/widgets/app_search_bar.dart';
import 'package:food_recipes_app/features/search/ui/widgets/app_search_body.dart';
import 'package:food_recipes_app/features/search/ui/widgets/items_not_found.dart';
import 'package:food_recipes_app/features/search/ui/widgets/start_search.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: BlocConsumer<SearchCubit, SearchState>(
          listenWhen: (previous, current) =>
              current is Loading || current is Success || current is Failure,
          buildWhen: (previous, current) =>
              current is Loading || current is Success || current is Failure,
          listener: (BuildContext context, SearchState<dynamic> state) {
            state.whenOrNull(
              loading: () {
                showDialog(
                  context: context,
                  builder: (context) =>  Center(
                    child:  LoadingAnimationWidget.inkDrop(
        color: AppColors.orange,
        size: 50.r,
      ),
                  ),
                );
              },
              success: (data) {
                context.pop();
                if (data.meals.isEmpty) {
                  widget = const ItemsNotFound();
                } else {
                  widget = AppSearchBody(
                    meals: data.meals,
                  );
                }
              },
              failure: (message) {
                context.pop();              
                widget = const ItemsNotFound();
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios)),
                    horizontalSpace(15),
                    AppSearchBar(
                      onSubmitted: (text) async {
                        if(text.isEmpty) return;
                        await context.read<SearchCubit>().emitSearch(text);
                      },
                    ),
                  ]),
                ),
                widget ?? const StartSearch(),
              ],
            );
          },
        )),
      ),
    );
  }
}


