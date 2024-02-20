class RegisterModel {
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;

  RegisterModel(
      {required this.email,
      required this.password,
      required this.userName,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      userName: map['userName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
