import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/core/theming/app_text_styles.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_cubit.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_state.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/add_your_favourite.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_favourite_list_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite'.tr(),
          style: AppTextStyles.font17BlackRegular.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () async {
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<FavouriteCubit, FavouriteState>(
          buildWhen: (previous, current) =>
              current is FavouriteLoading ||
              current is FavouriteSuccess ||
              current is FavouriteError,
          builder: (context, state) {
            state.whenOrNull(loading: () {
              widget = loadingWidget();
            }, success: (data) {
              widget = AppFavouriteListView(
                meals: data,
              );
            }, failure: (error) {
              widget = const AddYourFavourite();
            });

            return widget ?? const AddYourFavourite();
          },
        ),
      ),
    );
  }
}

Widget loadingWidget() {
  return Center(
    child: LoadingAnimationWidget.inkDrop(
      color: AppColors.orange,
      size: 90.r,
    ),
  );
}
