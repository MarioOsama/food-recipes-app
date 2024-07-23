import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/feature/Auth/data/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void logInAuth(
      {required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    emit(AuthLoginLoading());
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        emit(AuthLoginSuccess());
      }).catchError((error) {
        emit(AuthLoginError(error.toString()));
      });
    } catch (e) {
      emit(AuthLoginError(e.toString()));
    }
  }

  void signUpAuth(
      {required TextEditingController emailController,
      required TextEditingController nameController,
      required TextEditingController phoneController,
      required TextEditingController passController}) async {
    emit(AuthRegisterLoading());
    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      UserModel usersModel = UserModel(
        phone: phoneController.text,
        userImage:
            'https://static.vecteezy.com/system/resources/previews/020/911/731/original/profile-icon-avatar-icon-user-icon-person-icon-free-png.png',
        password: passController.text,
        email: emailController.text,
        userName: nameController.text,
        userId: result.user!.uid,
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(result.user!.uid)
          .set(usersModel.convertToMap())
          .then((value) {
        emit(AuthRegisterSuccess());
      }).catchError((error) {
        emit(AuthRegisterError(error.toString()));
      });
    } catch (e) {
      emit(AuthRegisterError(e.toString()));
    }
  }

  Future<void> forgotPassword({required TextEditingController emailController}) async {
    emit(ForgetPassLoading());
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text)
          .then((value) {
        emit(ForgetPassSuccess());
      }).catchError((error) {
        emit(ForgetPassError(error.toString()));
      });
    } catch (e) {
      emit(ForgetPassError(e.toString()));
    }
  }
}
