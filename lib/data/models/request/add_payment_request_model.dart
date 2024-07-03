import 'dart:convert';

class AddPaymentRequestModel {
  final String transactionId;
  final double paymentAmount;
  final int totalInstallments;

  AddPaymentRequestModel({
    required this.transactionId,
    required this.paymentAmount,
    required this.totalInstallments,
  });

  factory AddPaymentRequestModel.fromJson(String str) =>
      AddPaymentRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddPaymentRequestModel.fromMap(Map<String, dynamic> json) =>
      AddPaymentRequestModel(
        transactionId: json["transaction_id"],
        paymentAmount: json["payment_amount"],
        totalInstallments: json["total_installments"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "payment_amount": paymentAmount,
        "total_installments": totalInstallments,
      };
}
