import 'dart:convert';

class QuotationResponseModel {
  final String transactionId;
  final List<Datum> data;

  QuotationResponseModel({
    required this.transactionId,
    required this.data,
  });

  factory QuotationResponseModel.fromJson(String str) =>
      QuotationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuotationResponseModel.fromMap(Map<String, dynamic> json) =>
      QuotationResponseModel(
        transactionId: json["transaction_id"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "transaction_id": transactionId,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  final int vesselId;
  final String vesselName;
  final String portOfLoadingName;
  final String portOfDischargeName;
  final String portOfLoadingLatitude;
  final String portOfLoadingLongitude;
  final String portOfDischargeLatitude;
  final String portOfDischargeLongitude;
  final DateTime dateOfLoading;
  final int estimatedDay;
  final DateTime estimatedDateOfDischarge;
  final int estimatedCost;

  Datum({
    required this.vesselId,
    required this.vesselName,
    required this.portOfLoadingName,
    required this.portOfDischargeName,
    required this.portOfLoadingLatitude,
    required this.portOfLoadingLongitude,
    required this.portOfDischargeLatitude,
    required this.portOfDischargeLongitude,
    required this.dateOfLoading,
    required this.estimatedDay,
    required this.estimatedDateOfDischarge,
    required this.estimatedCost,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        vesselId: json["vessel_id"] is int
            ? json["vessel_id"]
            : int.parse(json["vessel_id"].toString()),
        vesselName: json["vessel_name"],
        portOfLoadingName: json["port_of_loading_name"],
        portOfDischargeName: json["port_of_discharge_name"],
        portOfLoadingLatitude: json["port_of_loading_latitude"],
        portOfLoadingLongitude: json["port_of_loading_longitude"],
        portOfDischargeLatitude: json["port_of_discharge_latitude"],
        portOfDischargeLongitude: json["port_of_discharge_longitude"],
        dateOfLoading: DateTime.parse(json["date_of_loading"]),
        estimatedDay: json["estimated_day"] is int
            ? json["estimated_day"]
            : int.parse(json["estimated_day"].toString()),
        estimatedDateOfDischarge:
            DateTime.parse(json["estimated_date_of_discharge"]),
        estimatedCost: json["estimated_cost"] is int
            ? json["estimated_cost"]
            : int.parse(json["estimated_cost"].toString()), // Ensure int type
      );

  Map<String, dynamic> toMap() => {
        "vessel_id": vesselId,
        "vessel_name": vesselName,
        "port_of_loading_name": portOfLoadingName,
        "port_of_discharge_name": portOfDischargeName,
        "port_of_loading_latitude": portOfLoadingLatitude,
        "port_of_loading_longitude": portOfLoadingLongitude,
        "port_of_discharge_latitude": portOfDischargeLatitude,
        "port_of_discharge_longitude": portOfDischargeLongitude,
        "date_of_loading":
            "${dateOfLoading.year.toString().padLeft(4, '0')}-${dateOfLoading.month.toString().padLeft(2, '0')}-${dateOfLoading.day.toString().padLeft(2, '0')}",
        "estimated_day": estimatedDay,
        "estimated_date_of_discharge":
            "${estimatedDateOfDischarge.year.toString().padLeft(4, '0')}-${estimatedDateOfDischarge.month.toString().padLeft(2, '0')}-${estimatedDateOfDischarge.day.toString().padLeft(2, '0')}",
        "estimated_cost": estimatedCost,
      };
}
