import 'dart:convert';

class HistoryResponseModel {
  final List<Datum>? data;

  HistoryResponseModel({
    this.data,
  });

  factory HistoryResponseModel.fromJson(String str) =>
      HistoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryResponseModel.fromMap(Map<String, dynamic> json) =>
      HistoryResponseModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  final int? id;
  final String? transactionId;
  final int? userId;
  final String? shipperName;
  final String? shipperAddress;
  final String? consigneeName;
  final String? consigneeAddress;
  final int? portOfLoadingId;
  final int? portOfDischargeId;
  final int? vesselId;
  final DateTime? dateOfLoading;
  final DateTime? dateOfDischarge;
  final String? status;
  final String? cargoDescription;
  final String? cargoWeight;
  final int? totalCost;
  final dynamic shippingInstructionDocumentUrl;
  final dynamic billOfLadingDocumentUrl;
  final dynamic cargoManifestDocumentUrl;
  final dynamic timeSheetDocumentUrl;
  final dynamic draughtSurveyDocumentUrl;
  final dynamic ratingStar;
  final dynamic review;
  final dynamic negotiationApprovedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final PortOf? portOfLoading;
  final PortOf? portOfDischarge;
  final VesselName? vesselName;

  Datum({
    this.id,
    this.transactionId,
    this.userId,
    this.shipperName,
    this.shipperAddress,
    this.consigneeName,
    this.consigneeAddress,
    this.portOfLoadingId,
    this.portOfDischargeId,
    this.vesselId,
    this.dateOfLoading,
    this.dateOfDischarge,
    this.status,
    this.cargoDescription,
    this.cargoWeight,
    this.totalCost,
    this.shippingInstructionDocumentUrl,
    this.billOfLadingDocumentUrl,
    this.cargoManifestDocumentUrl,
    this.timeSheetDocumentUrl,
    this.draughtSurveyDocumentUrl,
    this.ratingStar,
    this.review,
    this.negotiationApprovedAt,
    this.createdAt,
    this.updatedAt,
    this.portOfLoading,
    this.portOfDischarge,
    this.vesselName,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        transactionId: json["transaction_id"],
        userId: json["user_id"],
        shipperName: json["shipper_name"],
        shipperAddress: json["shipper_address"],
        consigneeName: json["consignee_name"],
        consigneeAddress: json["consignee_address"],
        portOfLoadingId: json["port_of_loading_id"],
        portOfDischargeId: json["port_of_discharge_id"],
        vesselId: json["vessel_id"],
        dateOfLoading: json["date_of_loading"] == null
            ? null
            : DateTime.parse(json["date_of_loading"]),
        dateOfDischarge: json["date_of_discharge"] == null
            ? null
            : DateTime.parse(json["date_of_discharge"]),
        status: json["status"],
        cargoDescription: json["cargo_description"],
        cargoWeight: json["cargo_weight"],
        totalCost: json["total_cost"],
        shippingInstructionDocumentUrl:
            json["shipping_instruction_document_url"],
        billOfLadingDocumentUrl: json["bill_of_lading_document_url"],
        cargoManifestDocumentUrl: json["cargo_manifest_document_url"],
        timeSheetDocumentUrl: json["time_sheet_document_url"],
        draughtSurveyDocumentUrl: json["draught_survey_document_url"],
        ratingStar: json["rating_star"],
        review: json["review"],
        negotiationApprovedAt: json["negotiation_approved_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        portOfLoading: json["port_of_loading"] == null
            ? null
            : PortOf.fromMap(json["port_of_loading"]),
        portOfDischarge: json["port_of_discharge"] == null
            ? null
            : PortOf.fromMap(json["port_of_discharge"]),
        vesselName: json["vessel_name"] == null
            ? null
            : VesselName.fromMap(json["vessel_name"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "transaction_id": transactionId,
        "user_id": userId,
        "shipper_name": shipperName,
        "shipper_address": shipperAddress,
        "consignee_name": consigneeName,
        "consignee_address": consigneeAddress,
        "port_of_loading_id": portOfLoadingId,
        "port_of_discharge_id": portOfDischargeId,
        "vessel_id": vesselId,
        "date_of_loading":
            "${dateOfLoading!.year.toString().padLeft(4, '0')}-${dateOfLoading!.month.toString().padLeft(2, '0')}-${dateOfLoading!.day.toString().padLeft(2, '0')}",
        "date_of_discharge":
            "${dateOfDischarge!.year.toString().padLeft(4, '0')}-${dateOfDischarge!.month.toString().padLeft(2, '0')}-${dateOfDischarge!.day.toString().padLeft(2, '0')}",
        "status": status,
        "cargo_description": cargoDescription,
        "cargo_weight": cargoWeight,
        "total_cost": totalCost,
        "shipping_instruction_document_url": shippingInstructionDocumentUrl,
        "bill_of_lading_document_url": billOfLadingDocumentUrl,
        "cargo_manifest_document_url": cargoManifestDocumentUrl,
        "time_sheet_document_url": timeSheetDocumentUrl,
        "draught_survey_document_url": draughtSurveyDocumentUrl,
        "rating_star": ratingStar,
        "review": review,
        "negotiation_approved_at": negotiationApprovedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "port_of_loading": portOfLoading?.toMap(),
        "port_of_discharge": portOfDischarge?.toMap(),
        "vessel_name": vesselName?.toMap(),
      };
}

class PortOf {
  final int? id;
  final String? name;
  final String? address;
  final String? countryCode;
  final String? unlocode;
  final String? latitude;
  final String? longitude;
  final String? openTime;
  final String? closeTime;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PortOf({
    this.id,
    this.name,
    this.address,
    this.countryCode,
    this.unlocode,
    this.latitude,
    this.longitude,
    this.openTime,
    this.closeTime,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory PortOf.fromJson(String str) => PortOf.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PortOf.fromMap(Map<String, dynamic> json) => PortOf(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        countryCode: json["country_code"],
        unlocode: json["unlocode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "country_code": countryCode,
        "unlocode": unlocode,
        "latitude": latitude,
        "longitude": longitude,
        "open_time": openTime,
        "close_time": closeTime,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class VesselName {
  final int? id;
  final String? vesselName;
  final String? vesselLat;
  final String? vesselLon;
  final String? vesselVtsSpeedKnot;
  final String? vesselCalcSpeedKnot;
  final String? vesselHeadingDegree;
  final String? vesselTxId;
  final String? pmlInternalVesselId;
  final DateTime? pmlLastUpdatedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VesselName({
    this.id,
    this.vesselName,
    this.vesselLat,
    this.vesselLon,
    this.vesselVtsSpeedKnot,
    this.vesselCalcSpeedKnot,
    this.vesselHeadingDegree,
    this.vesselTxId,
    this.pmlInternalVesselId,
    this.pmlLastUpdatedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory VesselName.fromJson(String str) =>
      VesselName.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VesselName.fromMap(Map<String, dynamic> json) => VesselName(
        id: json["id"],
        vesselName: json["vessel_name"],
        vesselLat: json["vessel_lat"],
        vesselLon: json["vessel_lon"],
        vesselVtsSpeedKnot: json["vessel_vts_speed_knot"],
        vesselCalcSpeedKnot: json["vessel_calc_speed_knot"],
        vesselHeadingDegree: json["vessel_heading_degree"],
        vesselTxId: json["vessel_tx_id"],
        pmlInternalVesselId: json["pml_internal_vessel_id"],
        pmlLastUpdatedAt: json["pml_last_updated_at"] == null
            ? null
            : DateTime.parse(json["pml_last_updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "vessel_name": vesselName,
        "vessel_lat": vesselLat,
        "vessel_lon": vesselLon,
        "vessel_vts_speed_knot": vesselVtsSpeedKnot,
        "vessel_calc_speed_knot": vesselCalcSpeedKnot,
        "vessel_heading_degree": vesselHeadingDegree,
        "vessel_tx_id": vesselTxId,
        "pml_internal_vessel_id": pmlInternalVesselId,
        "pml_last_updated_at": pmlLastUpdatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
