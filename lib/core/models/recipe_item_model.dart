class RecipeItemModel {
  final String id;
  final String title;
  final String imageUrl;
  final String category;
  final String steps;
  final List<String> ingredients;
  final List<String> measures;
  final String? subtitle;
  final String? tags;
  final String? youTubeVideoUrl;
  String? glass;
  String? section;

  RecipeItemModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.steps,
    required this.ingredients,
    required this.measures,
    this.subtitle,
    this.tags,
    this.glass,
    this.youTubeVideoUrl,
  });

  RecipeItemModel.fromId({
    required this.id,
    required this.section,
    this.title = '',
    this.imageUrl = '',
    this.category = '',
    this.steps = '',
    this.ingredients = const [],
    this.measures = const [],
    this.subtitle,
    this.tags,
    this.glass,
    this.youTubeVideoUrl,
  });
}
