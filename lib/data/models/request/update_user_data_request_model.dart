import 'dart:convert';
import 'dart:io';

class UpdateUserDataRequestModel {
  String name;
  String phone;
  String email;
  String? password;
  String companyName;
  String companyAddress;
  String companyNpwp;
  String companyPhone;
  String companyEmail;
  File? companyAkta;
  UpdateUserDataRequestModel({
    required this.name,
    required this.phone,
    required this.email,
    this.password,
    required this.companyName,
    required this.companyAddress,
    required this.companyNpwp,
    required this.companyPhone,
    required this.companyEmail,
    this.companyAkta,
  });

  UpdateUserDataRequestModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? companyName,
    String? companyAddress,
    String? companyNpwp,
    String? companyPhone,
    String? companyEmail,
    File? companyAkta,
  }) {
    return UpdateUserDataRequestModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      companyName: companyName ?? this.companyName,
      companyAddress: companyAddress ?? this.companyAddress,
      companyNpwp: companyNpwp ?? this.companyNpwp,
      companyPhone: companyPhone ?? this.companyPhone,
      companyEmail: companyEmail ?? this.companyEmail,
      companyAkta: companyAkta ?? this.companyAkta,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'name': name,
      'phone': phone,
      'email': email,
      // If password is null, don't send it
      if (password != null) 'password': password!,
      'company_name': companyName,
      'company_address': companyAddress,
      'company_NPWP': companyNpwp,
      'company_phone': companyPhone,
      'company_email': companyEmail,
    };
  }

  factory UpdateUserDataRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateUserDataRequestModel(
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      companyName: map['company_name'] as String,
      companyAddress: map['company_address'] as String,
      companyNpwp: map['company_NPWP'] as String,
      companyPhone: map['company_phone'] as String,
      companyEmail: map['company_email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateUserDataRequestModel.fromJson(String source) =>
      UpdateUserDataRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdateUserDataRequestModel(name: $name, phone: $phone, email: $email, password: $password, company_name: $companyName, company_address: $companyAddress, company_NPWP: $companyNpwp, company_phone: $companyPhone, company_email: $companyEmail, company_akta: $companyAkta)';
  }

  @override
  bool operator ==(covariant UpdateUserDataRequestModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.password == password &&
        other.companyName == companyName &&
        other.companyAddress == companyAddress &&
        other.companyNpwp == companyNpwp &&
        other.companyPhone == companyPhone &&
        other.companyEmail == companyEmail &&
        other.companyAkta == companyAkta;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode ^
        companyName.hashCode ^
        companyAddress.hashCode ^
        companyNpwp.hashCode ^
        companyPhone.hashCode ^
        companyEmail.hashCode ^
        companyAkta.hashCode;
  }
}
