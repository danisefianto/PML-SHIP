import 'package:meta/meta.dart';
import 'dart:convert';

class RegisterRequestModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String namePerusahaan;
  final String addressPerusahaan;
  final String npwpPerusahaan;
  final String phonePerusahaan;
  final String emailPerusahaan;
  final String aktaPerusahaan;

  RegisterRequestModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.namePerusahaan,
    required this.addressPerusahaan,
    required this.npwpPerusahaan,
    required this.phonePerusahaan,
    required this.emailPerusahaan,
    required this.aktaPerusahaan,
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
        namePerusahaan: json["name_perusahaan"],
        addressPerusahaan: json["address_perusahaan"],
        npwpPerusahaan: json["NPWP_perusahaan"],
        phonePerusahaan: json["phone_perusahaan"],
        emailPerusahaan: json["email_perusahaan"],
        aktaPerusahaan: json["akta_perusahaan"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "name_perusahaan": namePerusahaan,
        "address_perusahaan": addressPerusahaan,
        "NPWP_perusahaan": npwpPerusahaan,
        "phone_perusahaan": phonePerusahaan,
        "email_perusahaan": emailPerusahaan,
        "akta_perusahaan": aktaPerusahaan,
      };
}
