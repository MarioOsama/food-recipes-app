import 'package:json_annotation/json_annotation.dart';

part 'cocktail_filter_response_model.g.dart';

@JsonSerializable()
class CocktailFilterResponseModel {
  @JsonKey(name: 'drinks')
  final List<FilteredCocktailRecipeItemModel> cocktails;

  CocktailFilterResponseModel({required this.cocktails});

  factory CocktailFilterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailFilterResponseModelFromJson(json);
}

@JsonSerializable()
class FilteredCocktailRecipeItemModel {
  @JsonKey(name: 'idDrink')
  final String id;
  @JsonKey(name: 'strDrink')
  final String name;
  @JsonKey(name: 'strDrinkThumb')
  final String imageUrl;

  FilteredCocktailRecipeItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory FilteredCocktailRecipeItemModel.fromJson(Map<String, dynamic> json) =>
      _$FilteredCocktailRecipeItemModelFromJson(json);
}
