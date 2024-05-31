import 'dart:io';

class RegisterRequestModel {
  final String transactionId;
  final String type;
  final File document;

  RegisterRequestModel({
    required this.transactionId,
    required this.type,
    required this.document,
  });

  Map<String, String> toMap() {
    return {
      'transaction_id': transactionId,
      'type': type,
    };
  }
}
