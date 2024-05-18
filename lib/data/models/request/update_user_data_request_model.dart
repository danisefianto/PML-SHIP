import 'dart:convert';

class UpdateUserDataRequestModel {
  final String name;
  final String phone;
  final String email;
  // final String password;
  final String companyName;
  final String companyAddress;
  final String companyNpwp;
  final String companyPhone;
  final String companyEmail;

  UpdateUserDataRequestModel({
    required this.name,
    required this.phone,
    required this.email,
    // required this.password,
    required this.companyName,
    required this.companyAddress,
    required this.companyNpwp,
    required this.companyPhone,
    required this.companyEmail,
  });

  factory UpdateUserDataRequestModel.fromJson(String str) =>
      UpdateUserDataRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateUserDataRequestModel.fromMap(Map<String, dynamic> json) =>
      UpdateUserDataRequestModel(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        // password: json["password"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyNpwp: json["company_NPWP"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
        "email": email,
        // "password": password,
        "company_name": companyName,
        "company_address": companyAddress,
        "company_NPWP": companyNpwp,
        "company_phone": companyPhone,
        "company_email": companyEmail,
      };
}
