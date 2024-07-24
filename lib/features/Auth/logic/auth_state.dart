part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginLoading extends AuthState {}
final class AuthLoginSuccess extends AuthState {}
final class AuthLoginError extends AuthState {
  final String error;
  AuthLoginError(this.error);
}

final class AuthRegisterLoading extends AuthState {}
final class AuthRegisterSuccess extends AuthState {}
final class AuthRegisterError extends AuthState {
  final String error;
  AuthRegisterError(this.error);
}

final class ForgetPassLoading extends AuthState {}
final class ForgetPassSuccess extends AuthState {}
final class ForgetPassError extends AuthState {
  final String error;
  ForgetPassError(this.error);
}



