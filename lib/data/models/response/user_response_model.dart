import 'dart:convert';

class UserResponseModel {
  final String? status;
  final String? message;
  final Data? data;

  UserResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserResponseModel.fromJson(String str) =>
      UserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> json) =>
      UserResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final String? status;
  final String? role;
  final User? user;
  final Company? company;
  final dynamic reasonRejected;
  final dynamic rejectedAt;
  final DateTime? approvedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.status,
    this.role,
    this.user,
    this.company,
    this.reasonRejected,
    this.rejectedAt,
    this.approvedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        status: json["status"],
        role: json["role"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        company:
            json["company"] == null ? null : Company.fromMap(json["company"]),
        reasonRejected: json["reason_rejected"],
        rejectedAt: json["rejected_at"],
        approvedAt: json["approved_at"] == null
            ? null
            : DateTime.parse(json["approved_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "role": role,
        "user": user?.toMap(),
        "company": company?.toMap(),
        "reason_rejected": reasonRejected,
        "rejected_at": rejectedAt,
        "approved_at": approvedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Company {
  final String? companyName;
  final String? companyAddress;
  final String? companyPhone;
  final String? companyEmail;
  final String? companyNpwp;
  final String? companyAkta;

  Company({
    this.companyName,
    this.companyAddress,
    this.companyPhone,
    this.companyEmail,
    this.companyNpwp,
    this.companyAkta,
  });

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
        companyNpwp: json["company_NPWP"],
        companyAkta: json["company_akta"],
      );

  Map<String, dynamic> toMap() => {
        "company_name": companyName,
        "company_address": companyAddress,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "company_NPWP": companyNpwp,
        "company_akta": companyAkta,
      };
}

class User {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;

  User({
    this.id,
    this.name,
    this.phone,
    this.email,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
      };
}
