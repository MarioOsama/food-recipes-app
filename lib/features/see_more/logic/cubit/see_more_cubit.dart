import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_recipes_app/core/helpers/app_string.dart';
import 'package:food_recipes_app/features/see_more/data/models/filtered_recipe_item_model.dart';
import 'package:food_recipes_app/features/see_more/data/repos/see_more_repo.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_state.dart';

class SeeMoreCubit extends Cubit<SeeMoreState> {
  final SeeMoreRepo _seeMoreRepo;
  SeeMoreCubit(this._seeMoreRepo) : super(SeeMoreInitial());

  String categoryName = AppString.foods.tr();

  // Food
  void getFoodData() async {
    getFoodCategoriesData();
    getFoodFilteredData('Beef');
  }

  void getFoodCategoriesData() async {
    emit(SeeMoreCategoriesLoading());
    try {
      final categoriesData = await _seeMoreRepo.getFoodCategoriesData();
      emit(SeeMoreCategoriesSuccess(categoriesData.categories));
    } catch (e) {
      emit(SeeMoreCategoriesError(e.toString()));
    }
  }

  void getFoodFilteredData(String category) async {
    emit(SeeMoreRecipesLoading());
    try {
      final filteredData = await _seeMoreRepo.getFoodFilteredData(category);
      final List<FilteredRecipeItemModel> filteredRecipes =
          _getRecipes(filteredData.meals);
      emit(SeeMoreRecipesSuccess(filteredRecipes));
    } catch (e) {
      emit(SeeMoreCategoriesError(e.toString()));
    }
  }

  // Cocktail
  void getCocktailData() async {
    getCocktailCategoriesData();
    getCocktailFilteredData('Ordinary Drink');
  }

  void getCocktailCategoriesData() async {
    emit(SeeMoreCategoriesLoading());
    try {
      final categoriesData = await _seeMoreRepo.getCocktailCategoriesData();
      emit(SeeMoreCategoriesSuccess(categoriesData.categories));
    } catch (e) {
      emit(SeeMoreCategoriesError(e.toString()));
    }
  }

  void getCocktailFilteredData(String category) async {
    emit(SeeMoreRecipesLoading());
    try {
      final filteredData = await _seeMoreRepo.getCocktailFilteredData(category);
      final List<FilteredRecipeItemModel> filteredRecipes =
          _getRecipes(filteredData.cocktails);
      emit(SeeMoreRecipesSuccess(filteredRecipes));
    } catch (e) {
      emit(SeeMoreCategoriesError(e.toString()));
    }
  }

  // Helper
  void getSeeMoreData(String categoryName) {
    this.categoryName = categoryName;
    if (categoryName == AppString.foods.tr()) {
      getFoodData();
    } else if (categoryName == AppString.cocktails.tr()) {
      getCocktailData();
    }
  }

  List<FilteredRecipeItemModel> _getRecipes(List recipes) {
    return recipes.map((recipe) {
      return FilteredRecipeItemModel(
        id: recipe.id,
        title: recipe.name,
        imageUrl: recipe.imageUrl,
      );
    }).toList();
  }
}
