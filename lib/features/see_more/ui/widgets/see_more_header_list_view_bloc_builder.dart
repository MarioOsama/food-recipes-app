import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/features/see_more/data/models/category_model.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_cubit.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_state.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/see_more_header_list_veiw_item.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/see_more_header_list_view_item_shimmer.dart';

class SeeMoreHeaderListViewBlocBuilder extends StatelessWidget {
  const SeeMoreHeaderListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeMoreCubit, SeeMoreState>(
      buildWhen: (previous, current) =>
          current is SeeMoreCategoriesSuccess ||
          current is SeeMoreCategoriesError ||
          current is SeeMoreCategoriesLoading,
      builder: (context, state) {
        switch (state) {
          case SeeMoreCategoriesSuccess():
            {
              return _setupCategoriesSuccess(state.categories);
            }
          case SeeMoreCategoriesError():
            {
              return _setupCategoriesError(state.message);
            }
          default:
            {
              return _setupCategoriesLoading();
            }
        }
      },
    );
  }

  Widget _setupCategoriesSuccess(List<CategoryModel> categories) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (ctx, index) => SeeMoreHeaderListViewItem(
        title: categories[index].name,
      ),
    );
  }

  Widget _setupCategoriesError(String errorMessage) {
    return Center(child: Text(errorMessage));
  }

  Widget _setupCategoriesLoading() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (ctx, index) => const SeeMoreHeaderListViewItemShimmer(),
    );
  }
}
