// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserDataModel userData;
  ProfileSuccess({
    required this.userData,
  });
}

class ProfileFailure extends ProfileState {
  final String errorMsg;
  ProfileFailure({
    required this.errorMsg,
  });
}

class EditProfileLoading extends ProfileState {}

class EditProfileSuccess extends ProfileState {
  final UserDataModel userData;
  EditProfileSuccess({
    required this.userData,
  });
}

class EditProfileFailure extends ProfileState {
  final String errorMsg;
  EditProfileFailure({
    required this.errorMsg,
  });
}

class ImagePicked extends ProfileState {
  final File image;
  final UserDataModel userData;
  ImagePicked({
    required this.image,
    required this.userData,
  });
}

class ImagePickFailure extends ProfileState {
  final String errorMsg;
  ImagePickFailure({
    required this.errorMsg,
  });
}

class ResetPasswordSuccess extends ProfileState {
  final String msg;
  ResetPasswordSuccess({
    required this.msg,
  });
}

class ResetPasswordFailure extends ProfileState {
  final String msg;
  ResetPasswordFailure({
    required this.msg,
  });
}

class ResetPasswordLoading extends ProfileState {}

class DeleteUserLoading extends ProfileState {}

class DeleteUserSuccess extends ProfileState {
  final String msg;
  DeleteUserSuccess({
    required this.msg,
  });
}

class DeleteUserFailure extends ProfileState {
  final String msg;

  DeleteUserFailure({required this.msg});
}
