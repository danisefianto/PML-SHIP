import 'dart:io';

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
  final File companyAktaUrl;

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

  Map<String, String> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'company_name': companyName,
      'company_address': companyAddress,
      'company_phone': companyPhone,
      'company_email': companyEmail,
      'company_NPWP': companyNpwp,
    };
  }
}
