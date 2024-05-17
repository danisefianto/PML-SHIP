import 'dart:convert';

class SummaryOrderResponseModel {
  final DetailSummaryOrder data;

  SummaryOrderResponseModel({
    required this.data,
  });

  factory SummaryOrderResponseModel.fromJson(String str) =>
      SummaryOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SummaryOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      SummaryOrderResponseModel(
        data: DetailSummaryOrder.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class DetailSummaryOrder {
  final String? transactionId;
  final String? portOfLoadingId;
  final String? portOfDischargeId;
  final DateTime? dateOfLoading;
  final String? cargoDescription;
  final String? cargoWeight;
  final String? shipperName;
  final String? shipperAddress;
  final String? consigneeName;
  final String? consigneeAddress;

  DetailSummaryOrder({
    required this.transactionId,
    required this.portOfLoadingId,
    required this.portOfDischargeId,
    required this.dateOfLoading,
    required this.cargoDescription,
    required this.cargoWeight,
    required this.shipperName,
    required this.shipperAddress,
    required this.consigneeName,
    required this.consigneeAddress,
  });

  factory DetailSummaryOrder.fromJson(String str) =>
      DetailSummaryOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailSummaryOrder.fromMap(Map<String, dynamic> json) =>
      DetailSummaryOrder(
        transactionId: json["transaction_id"],
        portOfLoadingId: json["port_of_loading_id"],
        portOfDischargeId: json["port_of_discharge_id"],
        dateOfLoading: DateTime.parse(json["date_of_loading"]),
        cargoDescription: json["cargo_description"],
        cargoWeight: json["cargo_weight"],
        shipperName: json["shipper_name"],
        shipperAddress: json["shipper_address"],
        consigneeName: json["consignee_name"],
        consigneeAddress: json["consignee_address"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "port_of_loading_id": portOfLoadingId,
        "port_of_discharge_id": portOfDischargeId,
        "date_of_loading":
            "${dateOfLoading?.year.toString().padLeft(4, '0')}-${dateOfLoading?.month.toString().padLeft(2, '0')}-${dateOfLoading?.day.toString().padLeft(2, '0')}",
        "cargo_description": cargoDescription,
        "cargo_weight": cargoWeight,
        "shipper_name": shipperName,
        "shipper_address": shipperAddress,
        "consignee_name": consigneeName,
        "consignee_address": consigneeAddress,
      };
}
