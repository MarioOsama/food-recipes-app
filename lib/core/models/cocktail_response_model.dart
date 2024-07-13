import 'package:json_annotation/json_annotation.dart';

part 'cocktail_response_model.g.dart';

@JsonSerializable()
class CocktailResponseModel {
  const CocktailResponseModel(this.cocktails);

  @JsonKey(name: "drinks")
  final List<CocktailModel> cocktails;

  factory CocktailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailResponseModelFromJson(json);

  Map<String, dynamic> fromJson() => _$CocktailResponseModelToJson(this);
}

@JsonSerializable()
class CocktailModel {
  const CocktailModel(
    this.id,
    this.name,
    this.category,
    this.alcoholic,
    this.steps,
    this.imageUrl,
    this.tags,
    this.glass,
    this.ingredientsList,
    this.measuresList,
    this.youTubeVideoUrl,
  );

  @JsonKey(name: "idDrink")
  final String id;
  @JsonKey(name: "strDrink")
  final String name;
  @JsonKey(name: "strTags")
  final String? tags;
  @JsonKey(name: "strCategory")
  final String category;
  @JsonKey(name: "strAlcoholic")
  final String alcoholic;
  @JsonKey(name: "strInstructions")
  final String steps;
  @JsonKey(name: "strDrinkThumb")
  final String imageUrl;
  @JsonKey(name: "strGlass")
  final String? glass;
  @JsonKey(name: "strVideo")
  final String? youTubeVideoUrl;
  @JsonKey(fromJson: _ingredientsListFromJson)
  final List<String> ingredientsList;
  @JsonKey(fromJson: _measuresListFromJson)
  final List<String> measuresList;

  static List<String> _ingredientsListFromJson(dynamic json) {
    final List<String> ingredientsList = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'].toString();
      if (ingredient != 'null' && ingredient.trim().isNotEmpty) {
        ingredientsList.add(ingredient);
      }
    }
    return ingredientsList;
  }

  static List<String> _measuresListFromJson(dynamic json) {
    final List<String> ingredientsList = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strMeasure$i'].toString();
      if (ingredient != 'null' && ingredient.trim().isNotEmpty) {
        ingredientsList.add(ingredient);
      }
    }
    return ingredientsList;
  }

  factory CocktailModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailModelToJson(this);
}
