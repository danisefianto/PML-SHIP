// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserResponseModel {
  final FullUserData data;

  UserResponseModel({
    required this.data,
  });

  factory UserResponseModel.fromJson(String str) =>
      UserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> json) =>
      UserResponseModel(
        data: FullUserData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class FullUserData {
  final int id;
  final String role;
  final String name;
  final String phone;
  final String email;
  final DateTime? emailVerifiedAt;
  final String companyName;
  final String companyAddress;
  final String companyPhone;
  final String companyEmail;
  final String companyNpwp;
  final String companyAktaUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final DateTime? rejectedDate;
  final DateTime? approvedDate;

  FullUserData({
    required this.id,
    required this.role,
    required this.name,
    required this.phone,
    required this.email,
    this.emailVerifiedAt,
    required this.companyName,
    required this.companyAddress,
    required this.companyPhone,
    required this.companyEmail,
    required this.companyNpwp,
    required this.companyAktaUrl,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.rejectedDate,
    this.approvedDate,
  });

  factory FullUserData.fromJson(String str) =>
      FullUserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FullUserData.fromMap(Map<String, dynamic> json) => FullUserData(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] != null
            ? DateTime.parse(json["email_verified_at"])
            : null,
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
        companyNpwp: json["company_NPWP"],
        companyAktaUrl: json["company_akta_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] != null
            ? DateTime.parse(json["deleted_at"])
            : null,
        rejectedDate: json["rejectedDate"] != null
            ? DateTime.parse(json["rejectedDate"])
            : null,
        approvedDate: json["approvedDate"] != null
            ? DateTime.parse(json["approvedDate"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "role": role,
        "name": name,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "company_NPWP": companyNpwp,
        "company_akta_url": companyAktaUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
        "rejectedDate": rejectedDate?.toIso8601String(),
        "approvedDate": approvedDate?.toIso8601String(),
      };
}
