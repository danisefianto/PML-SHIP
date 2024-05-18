import 'dart:convert';

class QuotationRequestModel {
  final String transactionId;

  QuotationRequestModel({
    required this.transactionId,
  });

  factory QuotationRequestModel.fromJson(String str) =>
      QuotationRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuotationRequestModel.fromMap(Map<String, dynamic> json) =>
      QuotationRequestModel(
        transactionId: json["transaction_id"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
      };
}
