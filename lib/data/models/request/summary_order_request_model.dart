
import 'dart:convert';

class SummaryOrderRequestModel {
  final String transactionId;

  SummaryOrderRequestModel({
    required this.transactionId,
  });

  factory SummaryOrderRequestModel.fromJson(String str) =>
      SummaryOrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SummaryOrderRequestModel.fromMap(Map<String, dynamic> json) =>
      SummaryOrderRequestModel(
        transactionId: json["transaction_id"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
      };
}
