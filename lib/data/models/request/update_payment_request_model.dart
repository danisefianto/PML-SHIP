import 'dart:io';

class UpdatePaymentRequestModel {
  final String method;
  final File documentFile;
  UpdatePaymentRequestModel({
    required this.method,
    required this.documentFile,
  });

  Map<String, String> toMap() => {
        '_method': method,
      };
}
