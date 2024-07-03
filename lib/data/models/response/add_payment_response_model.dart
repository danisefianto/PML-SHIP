import 'dart:convert';

class AddPaymentResponseModel {
  final String status;
  final String message;
  final Data data;

  AddPaymentResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddPaymentResponseModel.fromJson(String str) =>
      AddPaymentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddPaymentResponseModel.fromMap(Map<String, dynamic> json) =>
      AddPaymentResponseModel(
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
  final String orderTransactionId;
  final DateTime paymentDueDate;
  final int paymentAmount;
  final int installmentNumber;
  final String paymentStatus;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  Data({
    required this.orderTransactionId,
    required this.paymentDueDate,
    required this.paymentAmount,
    required this.installmentNumber,
    required this.paymentStatus,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        orderTransactionId: json["order_transaction_id"],
        paymentDueDate: DateTime.parse(json["payment_due_date"]),
        paymentAmount: json["payment_amount"],
        installmentNumber: json["installment_number"],
        paymentStatus: json["payment_status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "order_transaction_id": orderTransactionId,
        "payment_due_date":
            "${paymentDueDate.year.toString().padLeft(4, '0')}-${paymentDueDate.month.toString().padLeft(2, '0')}-${paymentDueDate.day.toString().padLeft(2, '0')}",
        "payment_amount": paymentAmount,
        "installment_number": installmentNumber,
        "payment_status": paymentStatus,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
