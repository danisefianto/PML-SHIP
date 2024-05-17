import 'dart:convert';

class RegisterRequestModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String companyName;
  final String companyAddress;
  final String companyPhone;
  final String companyEmail;
  final String companyNpwp;
  final String companyAktaUrl;

  RegisterRequestModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.companyName,
    required this.companyAddress,
    required this.companyPhone,
    required this.companyEmail,
    required this.companyNpwp,
    required this.companyAktaUrl,
  });

  factory RegisterRequestModel.fromJson(String str) =>
      RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) =>
      RegisterRequestModel(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
        companyNpwp: json["company_NPWP"],
        companyAktaUrl: json["company_akta_url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "company_NPWP": companyNpwp,
        "company_akta_url": companyAktaUrl,
      };
}
