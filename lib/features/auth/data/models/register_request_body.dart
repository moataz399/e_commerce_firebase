class LoginRequestBody {
  String? email;
  String? password;

  LoginRequestBody({this.email, this.password});

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      LoginRequestBody(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
