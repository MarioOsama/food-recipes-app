import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/prefs/shared_preferences.dart';
import 'package:food_recipes_app/features/favourite/data/logic/cubit/favourite_state.dart';
import 'package:food_recipes_app/features/favourite/data/repos/favourite_repo.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepo favouriteRepo;
  FavouriteCubit(this.favouriteRepo) : super(const FavouriteState.initial());
  List<Meals> favouriteMeals = [];

  Future<void> getFavouriteMeals() async {
    emit(const FavouriteState.loading());
    final response = await favouriteRepo.getFavouriteMeals();
    response.when(
        success: (meals) {
          favouriteMeals.addAll(meals.meals);
          emit(FavouriteState.success(favouriteMeals));
        },
        failure: (message) => emit(FavouriteState.failure(message)));
  }

  Future<void> deleteFavorite(String id) async {
    await removeFavorite(id);
    if (favouriteMeals.isNotEmpty) {
      favouriteMeals.removeWhere((element) => element.idMeal == id);
    }
  }

  Future<void> deleteAllFavorites() async {
    await removeAllFavorites();
    if (favouriteMeals.isNotEmpty) favouriteMeals.clear();
    await Future.delayed(
      const Duration(seconds: 1),
      () => emit(const FavouriteState.loading()),
    );
    emit(const FavouriteState.success([]));
  }
}
