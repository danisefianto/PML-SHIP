import 'dart:convert';

class NewOrderRequestModel {
  final int portOfLoadingId;
  final int portOfDischargeId;
  final int vesselId;
  final DateTime dateOfLoading;
  final DateTime dateOfDischarge;
  final String cargoDescription;
  final String cargoWeight;
  final String shipperName;
  final String shipperAddress;
  final String consigneeName;
  final String consigneeAddress;
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;

  NewOrderRequestModel({
    required this.portOfLoadingId,
    required this.portOfDischargeId,
    required this.vesselId,
    required this.dateOfLoading,
    required this.dateOfDischarge,
    required this.cargoDescription,
    required this.cargoWeight,
    required this.shipperName,
    required this.shipperAddress,
    required this.consigneeName,
    required this.consigneeAddress,
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
  });

  factory NewOrderRequestModel.fromJson(String str) =>
      NewOrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewOrderRequestModel.fromMap(Map<String, dynamic> json) =>
      NewOrderRequestModel(
        portOfLoadingId: json["port_of_loading_id"],
        portOfDischargeId: json["port_of_discharge_id"],
        vesselId: json["vessel_id"],
        dateOfLoading: DateTime.parse(json["date_of_loading"]),
        dateOfDischarge: DateTime.parse(json["date_of_discharge"]),
        cargoDescription: json["cargo_description"],
        cargoWeight: json["cargo_weight"],
        shipperName: json["shipper_name"],
        shipperAddress: json["shipper_address"],
        consigneeName: json["consignee_name"],
        consigneeAddress: json["consignee_address"],
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
      );

  Map<String, dynamic> toMap() => {
        "port_of_loading_id": portOfLoadingId,
        "port_of_discharge_id": portOfDischargeId,
        "vessel_id": vesselId,
        "date_of_loading":
            "${dateOfLoading.year.toString().padLeft(4, '0')}-${dateOfLoading.month.toString().padLeft(2, '0')}-${dateOfLoading.day.toString().padLeft(2, '0')}",
        "date_of_discharge":
            "${dateOfDischarge.year.toString().padLeft(4, '0')}-${dateOfDischarge.month.toString().padLeft(2, '0')}-${dateOfDischarge.day.toString().padLeft(2, '0')}",
        "cargo_description": cargoDescription,
        "cargo_weight": cargoWeight,
        "shipper_name": shipperName,
        "shipper_address": shipperAddress,
        "consignee_name": consigneeName,
        "consignee_address": consigneeAddress,
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
      };
}
