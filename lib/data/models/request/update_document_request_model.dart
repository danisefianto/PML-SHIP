// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class UpdateDocumentRequestModel {
  final String transactionId;
  final String type;
  final String method;
  final File document;

  UpdateDocumentRequestModel({
    required this.transactionId,
    required this.type,
    required this.method,
    required this.document,
  });

  Map<String, String> toMap() {
    return {
      'transaction_id': transactionId,
      'type': type,
      '_method': method,
    };
  }
}
