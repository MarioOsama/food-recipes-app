import 'package:bloc/bloc.dart';
import 'package:food_recipes_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Home sections title
  final List<String> titles = ['Foods', 'Cocktails'];
}
