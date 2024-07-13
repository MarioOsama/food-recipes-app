import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CocktailCategoriesResponseModel {
  @JsonKey(name: 'drinks')
  final List<CategoryModel> categories;

  CocktailCategoriesResponseModel({required this.categories});

  factory CocktailCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailCategoriesResponseModelFromJson(json);
}

@JsonSerializable()
class FoodCategoriesResponseModel {
  final List<CategoryModel> categories;

  FoodCategoriesResponseModel({required this.categories});

  factory FoodCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoriesResponseModelFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'idCategory')
  final String? id;
  @JsonKey(name: 'strCategory')
  final String name;

  CategoryModel({this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
