import 'dart:convert';

class CheckQuotationRequestModel {
  final String transactionId;

  CheckQuotationRequestModel({
    required this.transactionId,
  });

  factory CheckQuotationRequestModel.fromJson(String str) =>
      CheckQuotationRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckQuotationRequestModel.fromMap(Map<String, dynamic> json) =>
      CheckQuotationRequestModel(
        transactionId: json["transaction_id"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
      };
}
