import 'package:json_annotation/json_annotation.dart';

part 'food_filter_response_model.g.dart';

@JsonSerializable()
class FoodFilterResponseModel {
  final List<FilteredFoodRecipeItemModel> meals;

  FoodFilterResponseModel({required this.meals});

  factory FoodFilterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FoodFilterResponseModelFromJson(json);
}

@JsonSerializable()
class FilteredFoodRecipeItemModel {
  @JsonKey(name: 'idMeal')
  final String id;
  @JsonKey(name: 'strMeal')
  final String name;
  @JsonKey(name: 'strMealThumb')
  final String imageUrl;

  FilteredFoodRecipeItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory FilteredFoodRecipeItemModel.fromJson(Map<String, dynamic> json) =>
      _$FilteredFoodRecipeItemModelFromJson(json);
}
