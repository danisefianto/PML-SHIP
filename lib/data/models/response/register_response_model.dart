import 'package:meta/meta.dart';
import 'dart:convert';

class RegisterResponseModel {
  final Data data;

  RegisterResponseModel({
    required this.data,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final int? id;
  final String? role;
  final String? name;
  final String? email;

  Data({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "role": role,
        "name": name,
        "email": email,
      };
}
