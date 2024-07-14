
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_state.freezed.dart';
@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = _Initial;
  const factory FavouriteState.loading() = FavouriteLoading;
  const factory FavouriteState.success(List<Meals> data) = FavouriteSuccess;
  const factory FavouriteState.failure(String message) = FavouriteError;
}
