import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/helpers/spacing.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/FavouriteShimmerItem.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_cubit.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_state.dart';
import 'package:food_recipes_app/features/search/ui/widgets/app_search_bar.dart';
import 'package:food_recipes_app/features/search/ui/widgets/app_search_body.dart';
import 'package:food_recipes_app/features/search/ui/widgets/items_not_found.dart';
import 'package:food_recipes_app/features/search/ui/widgets/start_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: BlocConsumer<SearchCubit, SearchState>(
          buildWhen: (previous, current) =>
              current is Loading || current is Success || current is Failure,
          listener: (BuildContext context, SearchState<dynamic> state) {
            state.whenOrNull(
              loading: () {
                widget = setupLoading(context);
              },
              success: (data) {
                if (data.meals.isEmpty) {
                  widget = const ItemsNotFound();
                } else {
                  widget = AppSearchBody(
                    meals: data.meals,
                  );
                }
              },
              failure: (message) {
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    horizontalSpace(15),
                    AppSearchBar(
                      onSubmitted: (text) async {
                        if (text.isEmpty) return;
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

Widget getShimmerItems() {
  return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const FavouriteShimmerItem());
}

Widget setupLoading(context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: getShimmerItems()),
  );
}
