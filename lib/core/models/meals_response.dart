import 'package:freezed_annotation/freezed_annotation.dart';
part 'meals_response.g.dart';
@JsonSerializable()
class MealsResponse {
  @JsonKey(name: 'meals')
 final List<Meals> meals;

  MealsResponse({required this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) => _$MealsResponseFromJson(json);
}

@JsonSerializable()
class Meals {
 final dynamic idMeal;
final dynamic strMeal;
final  dynamic strDrinkAlternate;
final  dynamic strCategory;
final  dynamic strArea;
final  dynamic strInstructions;
final  dynamic strMealThumb;
final  dynamic strTags;
final  dynamic strYoutube;

  Meals({required this.idMeal, required this.strMeal, required this.strDrinkAlternate, required this.strCategory, required this.strArea, required this.strInstructions, required this.strMealThumb, required this.strTags, required this.strYoutube});

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);

}
