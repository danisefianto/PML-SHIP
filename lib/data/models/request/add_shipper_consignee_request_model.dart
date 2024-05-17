
import 'dart:convert';

class AddShipperConsigneeRequestModel {
  final String transactionId;
  final String shipperName;
  final String shipperAddress;
  final String consigneeName;
  final String consigneeAddress;

  AddShipperConsigneeRequestModel({
    required this.transactionId,
    required this.shipperName,
    required this.shipperAddress,
    required this.consigneeName,
    required this.consigneeAddress,
  });

  factory AddShipperConsigneeRequestModel.fromJson(String str) =>
      AddShipperConsigneeRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddShipperConsigneeRequestModel.fromMap(Map<String, dynamic> json) =>
      AddShipperConsigneeRequestModel(
        transactionId: json["transaction_id"],
        shipperName: json["shipper_name"],
        shipperAddress: json["shipper_address"],
        consigneeName: json["consignee_name"],
        consigneeAddress: json["consignee_address"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "shipper_name": shipperName,
        "shipper_address": shipperAddress,
        "consignee_name": consigneeName,
        "consignee_address": consigneeAddress,
      };
}
