
import 'dart:convert';

class AuthResponseModel {
  final User data;
  final String token;

  AuthResponseModel({
    required this.data,
    required this.token,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        data: User.fromMap(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
        "token": token,
      };
}

class User {
  final int id;
  final String role;
  final String name;
  final String email;

  User({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
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
