import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String password, email, userName, userId , phone , userImage;

  UserModel(
      {required this.password,
      required this.email,
      required this.phone,
      required this.userImage,
      required this.userName,
      required this.userId});

  Map<String, dynamic> convertToMap() {
    return {
      'password': password,
      'email': email,
      'userName': userName,
      'phone':phone,
      'userImage':userImage,
      'userId': userId
    };
  }

  static convertSnapToModel(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        password: snapshot['password'],
        email: snapshot['email'],
        phone: snapshot['phone'],
        userImage: snapshot['userImage'],
        userName: snapshot['userName'],
        userId: snapshot['userId']);
  }
}
