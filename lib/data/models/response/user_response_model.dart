import 'dart:convert';

class UserResponseModel {
  final String status;
  final String message;
  final FullUserData data;

  UserResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserResponseModel.fromJson(String str) =>
      UserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> json) =>
      UserResponseModel(
        status: json["status"],
        message: json["message"],
        data: FullUserData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class FullUserData {
  final int id;
  final String status;
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
  final String companyAkta;
  final String? reasonRejected;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? rejectedAt;
  final DateTime? approvedAt;
  final DateTime? deletedAt;

  FullUserData({
    required this.id,
    required this.status,
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
    required this.companyAkta,
    this.reasonRejected,
    required this.createdAt,
    required this.updatedAt,
    this.rejectedAt,
    this.approvedAt,
    this.deletedAt,
  });

  factory FullUserData.fromJson(String str) =>
      FullUserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FullUserData.fromMap(Map<String, dynamic> json) => FullUserData(
        id: json["id"],
        status: json["status"],
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
        companyAkta: json["company_akta"],
        reasonRejected: json["reason_rejected"] as String?,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rejectedAt: json["rejected_at"] != null
            ? DateTime.parse(json["rejected_at"])
            : null,
        approvedAt: json["approved_at"] != null
            ? DateTime.parse(json["approved_at"])
            : null,
        deletedAt: json["deleted_at"] != null
            ? DateTime.parse(json["deleted_at"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "role": role,
        "name": name,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "company_NPWP": companyNpwp,
        "company_akta": companyAkta,
        "reason_rejected": reasonRejected,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rejected_at": rejectedAt?.toIso8601String(),
        "approved_at": approvedAt?.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
      };
}
