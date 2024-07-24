// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsResponse _$MealsResponseFromJson(Map<String, dynamic> json) =>
    MealsResponse(
      meals: (json['meals'] as List<dynamic>)
          .map((e) => Meals.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsResponseToJson(MealsResponse instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strDrinkAlternate': instance.strDrinkAlternate,
      'strCategory': instance.strCategory,
      'strArea': instance.strArea,
      'strInstructions': instance.strInstructions,
      'strMealThumb': instance.strMealThumb,
      'strTags': instance.strTags,
      'strYoutube': instance.strYoutube,
    };
