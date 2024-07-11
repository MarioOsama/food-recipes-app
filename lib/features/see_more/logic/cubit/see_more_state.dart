import 'package:food_recipes_app/features/see_more/data/models/category_model.dart';

abstract class SeeMoreState {}

final class SeeMoreInitial extends SeeMoreState {}

final class SeeMoreCategoriesLoading extends SeeMoreState {}

final class SeeMoreCategoriesSuccess extends SeeMoreState {
  SeeMoreCategoriesSuccess(this.categories);

  final List<CategoryModel> categories;
}

final class SeeMoreCategoriesError extends SeeMoreState {
  SeeMoreCategoriesError(this.message);

  final String message;
}
