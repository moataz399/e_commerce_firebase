class UserModel {
  final String email;
  final String userName;
  final String phoneNubmer;
  final String profilePicture;
  final String userId;

  UserModel(
      {required this.email,
      required this.userName,
      required this.userId,
      required this.phoneNubmer,
      required this.profilePicture});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['Email'] ?? '',
        userId: json['UserId']??'',
        userName: json['UserName'] ?? "",
        phoneNubmer: json['PhoneNumber'] ?? '',
        profilePicture: json['ProfilePicture'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'UserName': userName,
      'UserId':userId,
      'PhoneNumber': phoneNubmer,
      'ProfilePicture': profilePicture
    };
  }
}
