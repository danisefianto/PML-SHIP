import 'dart:convert';

class NewCheckQuotationResponseModel {
  final String status;
  final String message;
  final List<Datum> data;

  NewCheckQuotationResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NewCheckQuotationResponseModel.fromJson(String str) =>
      NewCheckQuotationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewCheckQuotationResponseModel.fromMap(Map<String, dynamic> json) =>
      NewCheckQuotationResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  final int id;
  final String vesselName;
  final String portOfLoadingName;
  final String portOfLoadingLatitude;
  final String portOfLoadingLongitude;
  final String portOfDischargeName;
  final String portOfDischargeLatitude;
  final String portOfDischargeLongitude;
  final int dayEstimation;
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;
  final DateTime estimatedDateOfDischarge;

  Datum({
    required this.id,
    required this.vesselName,
    required this.portOfLoadingName,
    required this.portOfLoadingLatitude,
    required this.portOfLoadingLongitude,
    required this.portOfDischargeName,
    required this.portOfDischargeLatitude,
    required this.portOfDischargeLongitude,
    required this.dayEstimation,
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
    required this.estimatedDateOfDischarge,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        vesselName: json["vessel_name"],
        portOfLoadingName: json["port_of_loading_name"],
        portOfLoadingLatitude: json["port_of_loading_latitude"],
        portOfLoadingLongitude: json["port_of_loading_longitude"],
        portOfDischargeName: json["port_of_discharge_name"],
        portOfDischargeLatitude: json["port_of_discharge_latitude"],
        portOfDischargeLongitude: json["port_of_discharge_longitude"],
        dayEstimation: json["day_estimation"],
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
        estimatedDateOfDischarge:
            DateTime.parse(json["estimated_date_of_discharge"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "vessel_name": vesselName,
        "port_of_loading_name": portOfLoadingName,
        "port_of_loading_latitude": portOfLoadingLatitude,
        "port_of_loading_longitude": portOfLoadingLongitude,
        "port_of_discharge_name": portOfDischargeName,
        "port_of_discharge_latitude": portOfDischargeLatitude,
        "port_of_discharge_longitude": portOfDischargeLongitude,
        "day_estimation": dayEstimation,
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
        "estimated_date_of_discharge":
            "${estimatedDateOfDischarge.year.toString().padLeft(4, '0')}-${estimatedDateOfDischarge.month.toString().padLeft(2, '0')}-${estimatedDateOfDischarge.day.toString().padLeft(2, '0')}",
      };
}
