import 'dart:convert';

class GetAllDocumentsResponseModel {
  final String status;
  final String message;
  final List<Datum> data;

  GetAllDocumentsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllDocumentsResponseModel.fromJson(String str) =>
      GetAllDocumentsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllDocumentsResponseModel.fromMap(Map<String, dynamic> json) =>
      GetAllDocumentsResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  final int id;
  final String orderTransactionId;
  final String? documentName;
  final String documentType;
  final DateTime? uploadedAt;
  final DateTime? maxInputDocumentAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.orderTransactionId,
    this.documentName,
    required this.documentType,
    this.uploadedAt,
    this.maxInputDocumentAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderTransactionId: json["order_transaction_id"],
        documentName: json["document_name"],
        documentType: json["document_type"],
        uploadedAt: json["uploaded_at"] != null
            ? DateTime.parse(json["uploaded_at"])
            : null,
        maxInputDocumentAt: json["max_input_document_at"] != null
            ? DateTime.parse(json["max_input_document_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_transaction_id": orderTransactionId,
        "document_name": documentName,
        "document_type": documentType,
        "uploaded_at": uploadedAt?.toIso8601String(),
        "max_input_document_at": maxInputDocumentAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
