// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_filter_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodFilterResponseModel _$FoodFilterResponseModelFromJson(
        Map<String, dynamic> json) =>
    FoodFilterResponseModel(
      meals: (json['meals'] as List<dynamic>)
          .map((e) =>
              FilteredFoodRecipeItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodFilterResponseModelToJson(
        FoodFilterResponseModel instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

FilteredFoodRecipeItemModel _$FilteredFoodRecipeItemModelFromJson(
        Map<String, dynamic> json) =>
    FilteredFoodRecipeItemModel(
      id: json['idMeal'] as String,
      name: json['strMeal'] as String,
      imageUrl: json['strMealThumb'] as String,
    );

Map<String, dynamic> _$FilteredFoodRecipeItemModelToJson(
        FilteredFoodRecipeItemModel instance) =>
    <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.name,
      'strMealThumb': instance.imageUrl,
    };
