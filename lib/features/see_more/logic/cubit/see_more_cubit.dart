import 'package:bloc/bloc.dart';
import 'package:food_recipes_app/core/models/cocktail_response_model.dart';
import 'package:food_recipes_app/features/see_more/data/models/category_model.dart';
import 'package:food_recipes_app/features/see_more/data/repos/see_more_repo.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_state.dart';

class SeeMoreCubit extends Cubit<SeeMoreState> {
  final SeeMoreRepo _seeMoreRepo;
  SeeMoreCubit(this._seeMoreRepo) : super(SeeMoreInitial());

  // Food
  void getFoodCategoriesData() async {
    emit(SeeMoreCategoriesLoading());
    try {
      final categoriesData = await _seeMoreRepo.getFoodCategoriesData();
      emit(SeeMoreCategoriesSuccess(categoriesData.categories));
    } catch (e) {
      emit(SeeMoreCategoriesError(e.toString()));
    }
  }

  // Cocktail
  void getCocktailCategoriesData() async {
    emit(SeeMoreCategoriesLoading());
    try {
      final categoriesData = await _seeMoreRepo.getCocktailCategoriesData();
      emit(SeeMoreCategoriesSuccess(categoriesData.categories));
    } catch (e) {
      emit(SeeMoreCategoriesError(e.toString()));
    }
  }
}
