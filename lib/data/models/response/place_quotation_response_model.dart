import 'dart:convert';

class PlaceQuotationResponseModel {
  final Data data;

  PlaceQuotationResponseModel({
    required this.data,
  });

  factory PlaceQuotationResponseModel.fromJson(String str) =>
      PlaceQuotationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceQuotationResponseModel.fromMap(Map<String, dynamic> json) =>
      PlaceQuotationResponseModel(
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
  final int vesselId;
  final int portOfLoadingId;
  final int portOfDischargeId;
  final DateTime dateOfLoading;
  final DateTime dateOfDischarge;
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;

  Order({
    required this.vesselId,
    required this.portOfLoadingId,
    required this.portOfDischargeId,
    required this.dateOfLoading,
    required this.dateOfDischarge,
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
  });

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        vesselId: json["vessel_id"],
        portOfLoadingId: json["port_of_loading_id"],
        portOfDischargeId: json["port_of_discharge_id"],
        dateOfLoading: DateTime.parse(json["date_of_loading"]),
        dateOfDischarge: DateTime.parse(json["date_of_discharge"]),
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
      );

  Map<String, dynamic> toMap() => {
        "vessel_id": vesselId,
        "port_of_loading_id": portOfLoadingId,
        "port_of_discharge_id": portOfDischargeId,
        "date_of_loading":
            "${dateOfLoading.year.toString().padLeft(4, '0')}-${dateOfLoading.month.toString().padLeft(2, '0')}-${dateOfLoading.day.toString().padLeft(2, '0')}",
        "date_of_discharge":
            "${dateOfDischarge.year.toString().padLeft(4, '0')}-${dateOfDischarge.month.toString().padLeft(2, '0')}-${dateOfDischarge.day.toString().padLeft(2, '0')}",
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
      };
}
