// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkResponse _$DrinkResponseFromJson(Map<String, dynamic> json) =>
    DrinkResponse(
      drinks: (json['drinks'] as List<dynamic>)
          .map((e) => DrinksData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinkResponseToJson(DrinkResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };

DrinksData _$DrinksDataFromJson(Map<String, dynamic> json) => DrinksData(
      json['strDrinkThumb'],
      idDrink: json['idDrink'],
      strDrink: json['strDrink'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strInstructions: json['strInstructions'],
      strTags: json['strTags'],
    );

Map<String, dynamic> _$DrinksDataToJson(DrinksData instance) =>
    <String, dynamic>{
      'idDrink': instance.idDrink,
      'strDrink': instance.strDrink,
      'strDrinkAlternate': instance.strDrinkAlternate,
      'strCategory': instance.strCategory,
      'strInstructions': instance.strInstructions,
      'strDrinkThumb': instance.strDrinkThumb,
      'strTags': instance.strTags,
    };
