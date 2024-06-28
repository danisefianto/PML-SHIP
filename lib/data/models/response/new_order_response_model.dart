import 'dart:convert';

class NewOrderResponseModel {
  final String status;
  final String message;
  final Data data;

  NewOrderResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NewOrderResponseModel.fromJson(String str) =>
      NewOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      NewOrderResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
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
  final String transactionId;
  final String status;
  final int tax;
  final int totalBill;
  final int userId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  Data({
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
    required this.transactionId,
    required this.status,
    required this.tax,
    required this.totalBill,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        transactionId: json["transaction_id"],
        status: json["status"],
        tax: json["tax"],
        totalBill: json["total_bill"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
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
        "transaction_id": transactionId,
        "status": status,
        "tax": tax,
        "total_bill": totalBill,
        "user_id": userId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
