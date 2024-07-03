import 'dart:convert';

class UpdateDocumentResponseModel {
  final String status;
  final String message;
  final Data data;

  UpdateDocumentResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateDocumentResponseModel.fromJson(String str) =>
      UpdateDocumentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateDocumentResponseModel.fromMap(Map<String, dynamic> json) =>
      UpdateDocumentResponseModel(
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
  final String transactionId;
  final Document document;

  Data({
    required this.transactionId,
    required this.document,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        transactionId: json["transaction_id"],
        document: Document.fromMap(json["document"]),
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "document": document.toMap(),
      };
}

class Document {
  final String documentName;
  final String documentType;
  final DateTime? maxInputAt;
  final DateTime? uploadedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Document({
    required this.documentName,
    required this.documentType,
    this.maxInputAt,
    this.uploadedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Document.fromJson(String str) => Document.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Document.fromMap(Map<String, dynamic> json) => Document(
        documentName: json["document_name"],
        documentType: json["document_type"],
        maxInputAt: json["max_input_at"] != null
            ? DateTime.parse(json["max_input_at"])
            : null,
        uploadedAt: json["uploaded_at"] != null
            ? DateTime.parse(json["uploaded_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "document_name": documentName,
        "document_type": documentType,
        "max_input_at": maxInputAt?.toIso8601String(),
        "uploaded_at": uploadedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
