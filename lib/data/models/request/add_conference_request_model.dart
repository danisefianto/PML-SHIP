import 'dart:convert';

class AddConferenceRequestModel {
  final String transactionId;
  final String conferenceType;
  final String location;
  final DateTime conferenceDate;
  final String conferenceTime;

  AddConferenceRequestModel({
    required this.transactionId,
    required this.conferenceType,
    required this.location,
    required this.conferenceDate,
    required this.conferenceTime,
  });

  factory AddConferenceRequestModel.fromJson(String str) =>
      AddConferenceRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddConferenceRequestModel.fromMap(Map<String, dynamic> json) =>
      AddConferenceRequestModel(
        transactionId: json["transaction_id"],
        conferenceType: json["conference_type"],
        location: json["location"],
        conferenceDate: DateTime.parse(json["conference_date"]),
        conferenceTime: json["conference_time"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "conference_type": conferenceType,
        "location": location,
        "conference_date":
            "${conferenceDate.year.toString().padLeft(4, '0')}-${conferenceDate.month.toString().padLeft(2, '0')}-${conferenceDate.day.toString().padLeft(2, '0')}",
        "conference_time": conferenceTime,
      };
}
