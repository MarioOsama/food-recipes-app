// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodResponseModel _$FoodResponseModelFromJson(Map<String, dynamic> json) =>
    FoodResponseModel(
      (json['meals'] as List<dynamic>)
          .map((e) => MealModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodResponseModelToJson(FoodResponseModel instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

MealModel _$MealModelFromJson(Map<String, dynamic> json) => MealModel(
      json['idMeal'] as String,
      json['strMeal'] as String,
      json['strCategory'] as String,
      json['strArea'] as String,
      json['strInstructions'] as String,
      json['strMealThumb'] as String,
      json['strTags'] as String?,
      json['strYoutube'] as String?,
      MealModel._ingredientsListFromJson(json),
      MealModel._measuresListFromJson(json),
    );

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.name,
      'strCategory': instance.category,
      'strArea': instance.country,
      'strInstructions': instance.steps,
      'strMealThumb': instance.imageUrl,
      'strTags': instance.tags,
      'strYoutube': instance.youTubeVideoUrl,
      'ingredientsList': instance.ingredientsList,
      'measuresList': instance.measuresList,
    };
