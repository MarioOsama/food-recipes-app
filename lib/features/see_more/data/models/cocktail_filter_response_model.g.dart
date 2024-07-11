// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_filter_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailFilterResponseModel _$CocktailFilterResponseModelFromJson(
        Map<String, dynamic> json) =>
    CocktailFilterResponseModel(
      cocktails: (json['drinks'] as List<dynamic>)
          .map((e) => FilteredCocktailRecipeItemModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailFilterResponseModelToJson(
        CocktailFilterResponseModel instance) =>
    <String, dynamic>{
      'drinks': instance.cocktails,
    };

FilteredCocktailRecipeItemModel _$FilteredCocktailRecipeItemModelFromJson(
        Map<String, dynamic> json) =>
    FilteredCocktailRecipeItemModel(
      id: json['idDrink'] as String,
      name: json['strDrink'] as String,
      imageUrl: json['strDrinkThumb'] as String,
    );

Map<String, dynamic> _$FilteredCocktailRecipeItemModelToJson(
        FilteredCocktailRecipeItemModel instance) =>
    <String, dynamic>{
      'idDrink': instance.id,
      'strDrink': instance.name,
      'strDrinkThumb': instance.imageUrl,
    };
