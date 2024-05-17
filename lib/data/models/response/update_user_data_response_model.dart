import 'dart:convert';

class UpdateUserDataResponseModel {
  final UpdatedUserData data;

  UpdateUserDataResponseModel({
    required this.data,
  });

  factory UpdateUserDataResponseModel.fromJson(String str) =>
      UpdateUserDataResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateUserDataResponseModel.fromMap(Map<String, dynamic> json) =>
      UpdateUserDataResponseModel(
        data: UpdatedUserData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class UpdatedUserData {
  final int id;
  final String role;
  final String name;
  final String email;
  final String companyName;
  final String companyAddress;
  final String companyPhone;
  final String companyEmail;
  final String companyNpwp;

  UpdatedUserData({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
    required this.companyName,
    required this.companyAddress,
    required this.companyPhone,
    required this.companyEmail,
    required this.companyNpwp,
  });

  factory UpdatedUserData.fromJson(String str) =>
      UpdatedUserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatedUserData.fromMap(Map<String, dynamic> json) => UpdatedUserData(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        email: json["email"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
        companyNpwp: json["company_NPWP"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "role": role,
        "name": name,
        "email": email,
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "company_NPWP": companyNpwp,
      };
}
