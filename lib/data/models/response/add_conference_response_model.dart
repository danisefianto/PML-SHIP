import 'dart:convert';

class AddConferenceResponseModel {
  final String status;
  final String message;
  final Data data;

  AddConferenceResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddConferenceResponseModel.fromJson(String str) =>
      AddConferenceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddConferenceResponseModel.fromMap(Map<String, dynamic> json) =>
      AddConferenceResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final String transactionId;
  final String conferenceType;
  final String location;
  final DateTime conferenceDate;
  final String conferenceTime;
  final int customerCompanyId;
  final String status;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  Data({
    required this.transactionId,
    required this.conferenceType,
    required this.location,
    required this.conferenceDate,
    required this.conferenceTime,
    required this.customerCompanyId,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        transactionId: json["transaction_id"],
        conferenceType: json["conference_type"],
        location: json["location"],
        conferenceDate: DateTime.parse(json["conference_date"]),
        conferenceTime: json["conference_time"],
        customerCompanyId: json["customer_company_id"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "conference_type": conferenceType,
        "location": location,
        "conference_date":
            "${conferenceDate.year.toString().padLeft(4, '0')}-${conferenceDate.month.toString().padLeft(2, '0')}-${conferenceDate.day.toString().padLeft(2, '0')}",
        "conference_time": conferenceTime,
        "customer_company_id": customerCompanyId,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
