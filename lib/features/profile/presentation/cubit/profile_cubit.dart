import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/m_user.dart';
import '../../data/models/m_user_data_edit.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  UserDataModel? userData;
  UserDataForEditModel userDataForEditModel = UserDataForEditModel();
  final picker = ImagePicker();
  late File image;

  Future<User?> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: 'mekey.samir1@gmail.com',
        password: 'philobater',
      );
      return userCredential.user;
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }

  Future<void> getUserData() async {
    if (userData != null) {
      emit(ProfileLoading());
      emit(ProfileSuccess(userData: userData!));
    } else {
      emit(ProfileLoading());
      DocumentSnapshot<Map<String, dynamic>> firebaseUserData = await firestore
          .collection('users')
          // TODO : need to change UserID To [auth.currentUser.uid]
          .doc(auth.currentUser!.uid)
          .get();
      userData = UserDataModel.fromMap(firebaseUserData.data()!);
      if (firebaseUserData.data() != null) {
        emit(ProfileSuccess(userData: userData!));
      }
    }
  }

  Future<void> updateUserData() async {
    try {
      emit(EditProfileLoading());

      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'email': userDataForEditModel.email,
        'phone': userDataForEditModel.phone,
        'userName': userDataForEditModel.userName,
      });
      await uploadFile(image);
      userData!.phone = userDataForEditModel.phone;
      userData!.email = userDataForEditModel.email;
      userData!.userName = userDataForEditModel.userName;
      emit(EditProfileSuccess(userData: userData!));
    } catch (e) {
      emit(EditProfileFailure(errorMsg: e.toString()));
    }
  }

  Future<void> uploadFile(File? image) async {
    if (image != null) {
      try {
        String fileName = basename(image.path);
        Reference ref = storage.ref().child('uploads/$fileName');
        UploadTask uploadTask = ref.putFile(image);
        TaskSnapshot taskSnapshot = await uploadTask;
        final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        await firestore.collection('users').doc(auth.currentUser!.uid).update({
          'userImage': downloadUrl,
        });

        log("Image uploaded successfully: $downloadUrl");
      } catch (e) {
        log("Error uploading image: $e");
      }
    }
  }

  Future<void> pickImageFromGallery(BuildContext context) async {
    try {
      final pickImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        image = File(pickImage.path);
        emit(ImagePicked(image: image, userData: userData!));
        emit(ProfileSuccess(userData: userData!));
      }
    } catch (e) {
      emit(ImagePickFailure(errorMsg: e.toString()));
      log('Error picking image: $e');
    }
  }

  late String newPassword = "";
  void changeNewPassword(String value) {
    newPassword = value;
    log(newPassword);
  }

  late String oldPassword = "";
  void changeOldPassword(String value) {
    oldPassword = value;
  }

  String currentPass = '';

  void changeCurrentPass(String value) {
    currentPass = value;
  }

  Future<void> resetPassword() async {
    try {
      emit(ResetPasswordLoading());

      User user = auth.currentUser!;
      AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!, password: oldPassword);
      await user.reauthenticateWithCredential(credential);

      await user.updatePassword(newPassword);

      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'password': newPassword,
      });

      emit(ResetPasswordSuccess(
          msg: "The password has been changed successfully"));
    } catch (e) {
      log(e.toString());
      emit(ResetPasswordFailure(
          msg: "Please make sure that the entered password is correct"));
    }
  }

  String passForDelete = '';

  void changePassForDelete(String value) {
    passForDelete = value;
  }

  Future<void> deleteUser() async {
    try {
      emit(DeleteUserLoading());
      User? user = auth.currentUser;

      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: passForDelete,
        );

        await user.reauthenticateWithCredential(credential);

        await firestore.collection('users').doc(user.uid).delete();

        await user.delete();

        await signOut();
        emit(DeleteUserSuccess(msg: "The user has been deleted successfully"));
      } else {
        emit(DeleteUserFailure(msg: "There is no user currently logged in"));
      }
    } catch (e) {
      emit(DeleteUserFailure(
          msg: "Please make sure that the information entered is correct"));
      log("حدث خطأ أثناء حذف المستخدم: $e");
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      print('تم تسجيل الخروج بنجاح');
    } catch (e) {
      print('حدث خطأ أثناء تسجيل الخروج: $e');
    }
  }
}
