import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_cubit.dart';
import 'package:food_recipes_app/features/search/logic/cubit/search_state.dart';

class BlocBuilderSearch extends StatelessWidget {
  const BlocBuilderSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
   listenWhen: (previous, current) => current is Loading||current is Success||current is Failure,
   buildWhen: (previous, current) => current is Loading||current is Success||current is Failure,
        listener: (BuildContext context, SearchState<dynamic> state) {
          
        },
        builder: (context, state) {
          return const SizedBox.shrink();
        },);
  }
}
