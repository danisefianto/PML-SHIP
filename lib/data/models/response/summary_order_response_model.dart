import 'dart:convert';

class SummaryOrderResponseModel {
  final Data data;

  SummaryOrderResponseModel({
    required this.data,
  });

  factory SummaryOrderResponseModel.fromJson(String str) =>
      SummaryOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SummaryOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      SummaryOrderResponseModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final String transactionId;
  final String vesselName;
  final String portOfLoadingName;
  final String portOfDischargeName;
  final DateTime dateOfLoading;
  final DateTime dateOfDischarge;
  final String cargoDescription;
  final String cargoWeight;
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;
  final String shipperName;
  final String shipperAddress;
  final String consigneeName;
  final String consigneeAddress;
  final dynamic negotiationApprovedAt;
  final DateTime updatedAt;
  final DateTime createdAt;

  Data({
    required this.transactionId,
    required this.vesselName,
    required this.portOfLoadingName,
    required this.portOfDischargeName,
    required this.dateOfLoading,
    required this.dateOfDischarge,
    required this.cargoDescription,
    required this.cargoWeight,
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
    required this.shipperName,
    required this.shipperAddress,
    required this.consigneeName,
    required this.consigneeAddress,
    required this.negotiationApprovedAt,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        transactionId: json["transaction_id"],
        vesselName: json["vessel_name"],
        portOfLoadingName: json["port_of_loading_name"],
        portOfDischargeName: json["port_of_discharge_name"],
        dateOfLoading: DateTime.parse(json["date_of_loading"]),
        dateOfDischarge: DateTime.parse(json["date_of_discharge"]),
        cargoDescription: json["cargo_description"],
        cargoWeight: json["cargo_weight"],
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
        shipperName: json["shipper_name"],
        shipperAddress: json["shipper_address"],
        consigneeName: json["consignee_name"],
        consigneeAddress: json["consignee_address"],
        negotiationApprovedAt: json["negotiation_approved_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "vessel_name": vesselName,
        "port_of_loading_name": portOfLoadingName,
        "port_of_discharge_name": portOfDischargeName,
        "date_of_loading":
            "${dateOfLoading.year.toString().padLeft(4, '0')}-${dateOfLoading.month.toString().padLeft(2, '0')}-${dateOfLoading.day.toString().padLeft(2, '0')}",
        "date_of_discharge":
            "${dateOfDischarge.year.toString().padLeft(4, '0')}-${dateOfDischarge.month.toString().padLeft(2, '0')}-${dateOfDischarge.day.toString().padLeft(2, '0')}",
        "cargo_description": cargoDescription,
        "cargo_weight": cargoWeight,
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
        "shipper_name": shipperName,
        "shipper_address": shipperAddress,
        "consignee_name": consigneeName,
        "consignee_address": consigneeAddress,
        "negotiation_approved_at": negotiationApprovedAt,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
