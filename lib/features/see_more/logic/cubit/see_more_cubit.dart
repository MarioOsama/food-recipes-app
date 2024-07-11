import 'package:bloc/bloc.dart';
import 'package:food_recipes_app/features/see_more/data/repos/see_more_repo.dart';
import 'package:food_recipes_app/features/see_more/logic/cubit/see_more_state.dart';

class SeeMoreCubit extends Cubit<SeeMoreState> {
  final SeeMoreRepo _seeMoreRepo;
  SeeMoreCubit(this._seeMoreRepo) : super(SeeMoreInitial());
}
