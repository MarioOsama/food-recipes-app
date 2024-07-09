import 'package:bloc/bloc.dart';
import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/features/home/data/models/home_recipe_item_model.dart';
import 'package:food_recipes_app/features/home/data/repos/home_repo.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;

  // Home sections title
  final List<String> titles = ['Foods', 'Cocktails'];

  // Food recipes
  /// Get [numberOfRecipes] random meals
  void getRandomFoodRecipes(int numberOfRecipes) async {
    final List<HomeRecipeItemModel> randomMeals = [];
    for (int i = 0; i < numberOfRecipes; i++) {
      final MealModel randomMeal = await _homeRepo.getRandomFoodRecipe();
      randomMeals.add(
        HomeRecipeItemModel(
          title: randomMeal.name,
          country: randomMeal.country,
          imageUrl: randomMeal.imageUrl,
        ),
      );
    }
    emit(
      HomeFoodRecipesSuccess(
        meals: randomMeals,
      ),
    );
  }
}
