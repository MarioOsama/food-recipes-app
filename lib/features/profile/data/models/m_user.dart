class UserDataModel {
  String? email;
  String? password;
  String? phone;
  String? userId;
  String? userImage;
  String? userName;

  UserDataModel({
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
  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      userId: map['userId'],
      userImage: map['userImage'],
      userName: map['userName'],
    );
  }
}
