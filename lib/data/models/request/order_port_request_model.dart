import 'package:meta/meta.dart';
import 'dart:convert';

class OrderPortRequestModel {
  final int portOfLoadingId;
  final int portOfDischargeId;
  final DateTime dateOfLoading;
  final String cargoDescription;
  final String cargoWeight;

  OrderPortRequestModel({
    required this.portOfLoadingId,
    required this.portOfDischargeId,
    required this.dateOfLoading,
    required this.cargoDescription,
    required this.cargoWeight,
  });

  factory OrderPortRequestModel.fromJson(String str) =>
      OrderPortRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderPortRequestModel.fromMap(Map<String, dynamic> json) =>
      OrderPortRequestModel(
        portOfLoadingId: json["port_of_loading_id"],
        portOfDischargeId: json["port_of_discharge_id"],
        dateOfLoading: DateTime.parse(json["date_of_loading"]),
        cargoDescription: json["cargo_description"],
        cargoWeight: json["cargo_weight"],
      );

  Map<String, dynamic> toMap() => {
        "port_of_loading_id": portOfLoadingId,
        "port_of_discharge_id": portOfDischargeId,
        "date_of_loading":
            "${dateOfLoading.year.toString().padLeft(4, '0')}-${dateOfLoading.month.toString().padLeft(2, '0')}-${dateOfLoading.day.toString().padLeft(2, '0')}",
        "cargo_description": cargoDescription,
        "cargo_weight": cargoWeight,
      };
}
