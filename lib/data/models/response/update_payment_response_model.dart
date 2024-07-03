import 'package:meta/meta.dart';
import 'dart:convert';

class UpdatePaymentResponseModel {
  final String status;

  UpdatePaymentResponseModel({
    required this.status,
  });

  factory UpdatePaymentResponseModel.fromJson(String str) =>
      UpdatePaymentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePaymentResponseModel.fromMap(Map<String, dynamic> json) =>
      UpdatePaymentResponseModel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
