import 'package:meta/meta.dart';
import 'dart:convert';

class RegisterResponseModel {
  final bool status;
  final String message;
  final String token;

  RegisterResponseModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "token": token,
      };
}
