// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailCategoriesResponseModel _$CocktailCategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CocktailCategoriesResponseModel(
      categories: (json['drinks'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailCategoriesResponseModelToJson(
        CocktailCategoriesResponseModel instance) =>
    <String, dynamic>{
      'drinks': instance.categories,
    };

FoodCategoriesResponseModel _$FoodCategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    FoodCategoriesResponseModel(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodCategoriesResponseModelToJson(
        FoodCategoriesResponseModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['idCategory'] as String?,
      name: json['strCategory'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'idCategory': instance.id,
      'strCategory': instance.name,
    };
