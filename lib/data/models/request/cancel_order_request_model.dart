import 'dart:convert';

class CancelOrderRequestModel {
  final DateTime canceledAt;

  CancelOrderRequestModel({
    required this.canceledAt,
  });

  CancelOrderRequestModel copyWith({
    DateTime? canceledAt,
  }) =>
      CancelOrderRequestModel(
        canceledAt: canceledAt ?? this.canceledAt,
      );

  factory CancelOrderRequestModel.fromJson(String str) =>
      CancelOrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CancelOrderRequestModel.fromMap(Map<String, dynamic> json) =>
      CancelOrderRequestModel(
        canceledAt: DateTime.parse(json["canceled_at"]),
      );

  Map<String, dynamic> toMap() => {
        "canceled_at": canceledAt.toIso8601String(),
      };
}
