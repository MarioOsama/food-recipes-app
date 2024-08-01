import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes_app/core/di/dependency_injection.dart';
import 'package:food_recipes_app/core/theming/app_colors.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_cubit.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_state.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/FavouriteShimmerItem.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/add_your_favourite.dart';
import 'package:food_recipes_app/features/favourite/ui/widgets/app_favourite_body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: BlocProvider(
        create: (context) => FavouriteCubit(getIt())..getFavourite(),
        child: BlocBuilder<FavouriteCubit, FavouriteState>(
          buildWhen: (previous, current) =>
              current is FavouriteLoading ||
              current is FavouriteSuccess ||
              current is FavouriteError,
          builder: (context, state) {
            state.whenOrNull(loading: () {
              widget = setupLoading(context);
            }, success: (meals) {
              widget = AppFavouriteBody(
                meals: meals,
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
