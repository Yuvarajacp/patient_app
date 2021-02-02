import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    this.data,
  });

  DataSample data;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    data: json["data"] == null ? null : DataSample.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
  };
}

class DataSample {
  DataSample({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory DataSample.fromJson(Map<String, dynamic> json) => DataSample(
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "password": password == null ? null : password,
  };
}