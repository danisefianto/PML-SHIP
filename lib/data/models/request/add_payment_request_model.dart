import 'dart:convert';

class AddPaymentRequestModel {
  final String transactionId;
  final double totalBill;
  final int totalInstallments;

  AddPaymentRequestModel({
    required this.transactionId,
    required this.totalBill,
    required this.totalInstallments,
  });

  factory AddPaymentRequestModel.fromJson(String str) =>
      AddPaymentRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddPaymentRequestModel.fromMap(Map<String, dynamic> json) =>
      AddPaymentRequestModel(
        transactionId: json["transaction_id"],
        totalBill: json["payment_amount"],
        totalInstallments: json["total_installments"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "total_bill": totalBill,
        "total_installments": totalInstallments,
      };
}
