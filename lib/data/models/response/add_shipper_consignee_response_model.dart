
import 'dart:convert';

class AddShipperConsigneeResponseModel {
  final Data data;

  AddShipperConsigneeResponseModel({
    required this.data,
  });

  factory AddShipperConsigneeResponseModel.fromJson(String str) =>
      AddShipperConsigneeResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddShipperConsigneeResponseModel.fromMap(Map<String, dynamic> json) =>
      AddShipperConsigneeResponseModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final String message;
  final String transactionId;
  final Order order;

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
        order: Order.fromMap(json["order"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "transaction_id": transactionId,
        "order": order.toMap(),
      };
}

class Order {
  final String shipperName;
  final String shipperAddress;
  final String consigneeName;
  final String consigneeAddress;

  Order({
    required this.shipperName,
    required this.shipperAddress,
    required this.consigneeName,
    required this.consigneeAddress,
  });

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        shipperName: json["shipper_name"],
        shipperAddress: json["shipper_address"],
        consigneeName: json["consignee_name"],
        consigneeAddress: json["consignee_address"],
      );

  Map<String, dynamic> toMap() => {
        "shipper_name": shipperName,
        "shipper_address": shipperAddress,
        "consignee_name": consigneeName,
        "consignee_address": consigneeAddress,
      };
}
