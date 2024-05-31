import 'dart:convert';

class AddConferenceResponseModel {
  final Data data;

  AddConferenceResponseModel({
    required this.data,
  });

  factory AddConferenceResponseModel.fromJson(String str) =>
      AddConferenceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddConferenceResponseModel.fromMap(Map<String, dynamic> json) =>
      AddConferenceResponseModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final String message;
  final String transactionId;
  final ConferenceDetail conferenceDetail;

  Data({
    required this.message,
    required this.transactionId,
    required this.conferenceDetail,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        message: json["message"],
        transactionId: json["transaction_id"],
        conferenceDetail: ConferenceDetail.fromMap(json["conference_detail"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "transaction_id": transactionId,
        "conference_detail": conferenceDetail.toMap(),
      };
}

class ConferenceDetail {
  final String conferenceType;
  final String location;
  final DateTime conferenceDate;
  final String conferenceTime;

  ConferenceDetail({
    required this.conferenceType,
    required this.location,
    required this.conferenceDate,
    required this.conferenceTime,
  });

  factory ConferenceDetail.fromJson(String str) =>
      ConferenceDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConferenceDetail.fromMap(Map<String, dynamic> json) =>
      ConferenceDetail(
        conferenceType: json["conference_type"],
        location: json["location"],
        conferenceDate: DateTime.parse(json["conference_date"]),
        conferenceTime: json["conference_time"],
      );

  Map<String, dynamic> toMap() => {
        "conference_type": conferenceType,
        "location": location,
        "conference_date":
            "${conferenceDate.year.toString().padLeft(4, '0')}-${conferenceDate.month.toString().padLeft(2, '0')}-${conferenceDate.day.toString().padLeft(2, '0')}",
        "conference_time": conferenceTime,
      };
}
