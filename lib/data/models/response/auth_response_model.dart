import 'dart:convert';

class AuthResponseModel {
  final String? message;
  final String? accessToken;
  final String? tokenType;

  AuthResponseModel({
    this.message,
    this.accessToken,
    this.tokenType,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
