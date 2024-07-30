import 'package:json_annotation/json_annotation.dart';
part 'drink_response.g.dart';

@JsonSerializable()
class DrinkResponse {
  @JsonKey(name: 'drinks')
  final List<DrinksData> drinks;

  DrinkResponse({required this.drinks});
  factory DrinkResponse.fromJson(Map<String, dynamic> json) =>
      _$DrinkResponseFromJson(json);
}

@JsonSerializable()
class DrinksData {
  final dynamic idDrink;
  final dynamic strDrink;
  final dynamic strDrinkAlternate;
  final dynamic strCategory;
  final dynamic strInstructions;
  final dynamic strDrinkThumb;
  final dynamic strTags;

  DrinksData(
    this.strDrinkThumb, {
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strInstructions,
    required this.strTags,
  });
  factory DrinksData.fromJson(Map<String, dynamic> json) =>
      _$DrinksDataFromJson(json);
}
