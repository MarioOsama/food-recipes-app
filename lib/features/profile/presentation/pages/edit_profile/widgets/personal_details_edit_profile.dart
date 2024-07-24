import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes_app/features/profile/presentation/cubit/profile_cubit.dart';
import '../../../../data/models/m_user.dart';
import 'personal_details_card.dart';

class PersonalDetailsEditProfile extends StatefulWidget {
  const PersonalDetailsEditProfile({super.key});

  @override
  State<PersonalDetailsEditProfile> createState() =>
      _PersonalDetailsEditProfileState();
}

class _PersonalDetailsEditProfileState
    extends State<PersonalDetailsEditProfile> {
  late UserDataModel userData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess || state is ImagePicked) {
          final userData = state is ProfileSuccess
              ? state.userData
              : (state as ImagePicked).userData;
          final image = state is ImagePicked ? state.image : null;

          return PersonalDetailsCard(image: image, userData: userData);
        } else if (state is ProfileLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 80),
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProfileFailure) {
          return Center(child: Text(state.errorMsg));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
