import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String username;
  String password;

  LoginModel({
    this.username,
    this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "username": username,
      "password": password,
    };
    return map;
  }
}

class LoginResponseModel {
  String token;
  String error;

  LoginResponseModel({
    this.token,
    this.error,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : '',
      error: json["error"] != null ? json["error"] : '',
    );
  }
}
