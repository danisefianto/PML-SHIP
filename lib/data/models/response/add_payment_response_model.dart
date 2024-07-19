import 'dart:convert';

class AddPaymentResponseModel {
  final String? status;
  final String? message;
  final List<Datum>? data;

  AddPaymentResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddPaymentResponseModel.fromJson(String str) =>
      AddPaymentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddPaymentResponseModel.fromMap(Map<String, dynamic> json) =>
      AddPaymentResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  final String? orderTransactionId;
  final DateTime? paymentDueDate;
  final double? paymentAmount;
  final int? installmentNumber;
  final int? totalInstallments;
  final String? paymentStatus;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Datum({
    this.orderTransactionId,
    this.paymentDueDate,
    this.paymentAmount,
    this.installmentNumber,
    this.totalInstallments,
    this.paymentStatus,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        orderTransactionId: json["order_transaction_id"],
        paymentDueDate: json["payment_due_date"] == null
            ? null
            : DateTime.parse(json["payment_due_date"]),
        paymentAmount: json["payment_amount"]?.toDouble(),
        installmentNumber: json["installment_number"],
        totalInstallments: json["total_installments"],
        paymentStatus: json["payment_status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "order_transaction_id": orderTransactionId,
        "payment_due_date": paymentDueDate?.toIso8601String(),
        "payment_amount": paymentAmount,
        "installment_number": installmentNumber,
        "total_installments": totalInstallments,
        "payment_status": paymentStatus,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
