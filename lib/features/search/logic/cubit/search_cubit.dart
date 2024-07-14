import"package:flutter_bloc/flutter_bloc.dart";
import 'package:food_recipes_app/features/search/data/repos/meals_repo.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_state.dart';



class SearchCubit extends Cubit<SearchState> {
  final MealsRepo mealRepo;
  SearchCubit(this.mealRepo) : super(const SearchState.initial());

 Future<void> emitSearch(String query)async{
emit(const SearchState.loading());
final response=await mealRepo.getMeals(query);
response.when(success: (mealresponse) => emit(SearchState.success(mealresponse)),
 failure: (message) => emit(SearchState.failure(message)));
 }
}
