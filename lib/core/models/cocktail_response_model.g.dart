// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailResponseModel _$CocktailResponseModelFromJson(
        Map<String, dynamic> json) =>
    CocktailResponseModel(
      (json['drinks'] as List<dynamic>)
          .map((e) => CocktailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailResponseModelToJson(
        CocktailResponseModel instance) =>
    <String, dynamic>{
      'drinks': instance.cocktails,
    };

CocktailModel _$CocktailModelFromJson(Map<String, dynamic> json) =>
    CocktailModel(
      json['idDrink'] as String,
      json['strDrink'] as String,
      json['strCategory'] as String,
      json['strAlcoholic'] as String,
      json['strInstructions'] as String,
      json['strDrinkThumb'] as String,
      json['strTags'] as String?,
      json['strGlass'] as String?,
      CocktailModel._ingredientsListFromJson(json),
      CocktailModel._measuresListFromJson(json),
      json['strVideo'] as String?,
    );

Map<String, dynamic> _$CocktailModelToJson(CocktailModel instance) =>
    <String, dynamic>{
      'idDrink': instance.id,
      'strDrink': instance.name,
      'strTags': instance.tags,
      'strCategory': instance.category,
      'strAlcoholic': instance.alcoholic,
      'strInstructions': instance.steps,
      'strDrinkThumb': instance.imageUrl,
      'strGlass': instance.glass,
      'strVideo': instance.youTubeVideoUrl,
      'ingredientsList': instance.ingredientsList,
      'measuresList': instance.measuresList,
    };
