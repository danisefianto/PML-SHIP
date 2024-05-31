import 'dart:convert';

class PlaceQuotationRequestModel {
  final String transactionId;
  final int vesselId;
  final DateTime dateOfDischarge;
  final String shippingCost;
  final String handlingCost;
  final String biayaParkirPelabuhan;

  PlaceQuotationRequestModel({
    required this.transactionId,
    required this.vesselId,
    required this.dateOfDischarge,
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
  });

  factory PlaceQuotationRequestModel.fromJson(String str) =>
      PlaceQuotationRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceQuotationRequestModel.fromMap(Map<String, dynamic> json) =>
      PlaceQuotationRequestModel(
        transactionId: json["transaction_id"],
        vesselId: json["vessel_id"],
        dateOfDischarge: DateTime.parse(json["date_of_discharge"]),
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "vessel_id": vesselId,
        "date_of_discharge":
            "${dateOfDischarge.year.toString().padLeft(4, '0')}-${dateOfDischarge.month.toString().padLeft(2, '0')}-${dateOfDischarge.day.toString().padLeft(2, '0')}",
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
      };
}
