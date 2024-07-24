// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDataForEditModel {
  String? email;
  String? password;
  String? phone;
  String? userId;
  String? userImage;
  String? userName;
  UserDataForEditModel({
    this.email,
    this.password,
    this.phone,
    this.userId,
    this.userImage,
    this.userName,
  });

  void setEmail(String? value) => email = value;
  void setUserName(String? value) => userName = value;
  void setPhoneNum(String? value) => phone = value;
  void setPassword(String? value) => password = value;
  void setUserImage(String? value) => userImage = value;
}
