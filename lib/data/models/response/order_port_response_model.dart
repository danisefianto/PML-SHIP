import 'package:meta/meta.dart';
import 'dart:convert';

class OrderPortResponseModel {
  final Data data;

  OrderPortResponseModel({
    required this.data,
  });

  factory OrderPortResponseModel.fromJson(String str) =>
      OrderPortResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderPortResponseModel.fromMap(Map<String, dynamic> json) =>
      OrderPortResponseModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final String message;
  final String transactionId;
  final OrderPortData order;

  Data({
    required this.message,
    required this.transactionId,
    required this.order,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        message: json["message"],
        transactionId: json["transaction_id"],
        order: OrderPortData.fromMap(json["order"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "transaction_id": transactionId,
        "order": order.toMap(),
      };
}

class OrderPortData {
  final int portOfLoadingId;
  final int portOfDischargeId;
  final DateTime dateOfLoading;
  final String cargoDescription;
  final String cargoWeight;

  OrderPortData({
    required this.portOfLoadingId,
    required this.portOfDischargeId,
    required this.dateOfLoading,
    required this.cargoDescription,
    required this.cargoWeight,
  });

  factory OrderPortData.fromJson(String str) =>
      OrderPortData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderPortData.fromMap(Map<String, dynamic> json) => OrderPortData(
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
