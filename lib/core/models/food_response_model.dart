import 'package:json_annotation/json_annotation.dart';

part 'food_response_model.g.dart';

@JsonSerializable()
class FoodResponseModel {
  const FoodResponseModel(this.meals);

  final List<MealModel> meals;

  factory FoodResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FoodResponseModelFromJson(json);

  Map<String, dynamic> fromJson() => _$FoodResponseModelToJson(this);
}

@JsonSerializable()
class MealModel {
  const MealModel(
    this.id,
    this.name,
    this.category,
    this.country,
    this.steps,
    this.imageUrl,
    this.tags,
    this.youTubeVideoUrl,
    this.ingredientsList,
    this.measuresList,
  );

  @JsonKey(name: "idMeal")
  final String id;
  @JsonKey(name: "strMeal")
  final String name;
  @JsonKey(name: "strCategory")
  final String category;
  @JsonKey(name: "strArea")
  final String country;
  @JsonKey(name: "strInstructions")
  final String steps;
  @JsonKey(name: "strMealThumb")
  final String imageUrl;
  @JsonKey(name: "strTags")
  final String? tags;
  @JsonKey(name: "strYoutube")
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

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealModelToJson(this);
}
