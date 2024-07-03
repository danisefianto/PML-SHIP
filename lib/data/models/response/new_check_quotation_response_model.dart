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
  final int vesselId;
  final String vesselName;
  final int dayEstimation;
  final DateTime estimatedDateOfDischarge;
  final PortOf portOfLoading;
  final PortOf portOfDischarge;
  final Cost cost;

  Datum({
    required this.vesselId,
    required this.vesselName,
    required this.dayEstimation,
    required this.estimatedDateOfDischarge,
    required this.portOfLoading,
    required this.portOfDischarge,
    required this.cost,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        vesselId: json["vessel_id"],
        vesselName: json["vessel_name"],
        dayEstimation: json["day_estimation"],
        estimatedDateOfDischarge:
            DateTime.parse(json["estimated_date_of_discharge"]),
        portOfLoading: PortOf.fromMap(json["port_of_loading"]),
        portOfDischarge: PortOf.fromMap(json["port_of_discharge"]),
        cost: Cost.fromMap(json["cost"]),
      );

  Map<String, dynamic> toMap() => {
        "vessel_id": vesselId,
        "vessel_name": vesselName,
        "day_estimation": dayEstimation,
        "estimated_date_of_discharge":
            "${estimatedDateOfDischarge.year.toString().padLeft(4, '0')}-${estimatedDateOfDischarge.month.toString().padLeft(2, '0')}-${estimatedDateOfDischarge.day.toString().padLeft(2, '0')}",
        "port_of_loading": portOfLoading.toMap(),
        "port_of_discharge": portOfDischarge.toMap(),
        "cost": cost.toMap(),
      };
}

class Cost {
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;

  Cost({
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
  });

  factory Cost.fromJson(String str) => Cost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cost.fromMap(Map<String, dynamic> json) => Cost(
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
      );

  Map<String, dynamic> toMap() => {
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
      };
}

class PortOf {
  final String name;
  final String latitude;
  final String longitude;

  PortOf({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory PortOf.fromJson(String str) => PortOf.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PortOf.fromMap(Map<String, dynamic> json) => PortOf(
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };
}
