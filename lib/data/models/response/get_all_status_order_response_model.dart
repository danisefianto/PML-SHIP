import 'dart:convert';

class GetAllStatusOrderResponseModel {
  final String? status;
  final String? message;
  final List<Datum>? data;

  GetAllStatusOrderResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetAllStatusOrderResponseModel.fromJson(String str) =>
      GetAllStatusOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllStatusOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      GetAllStatusOrderResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  final String? status;
  final String? transactionId;
  final String? customerCompanyName;
  final Vessel? vessel;
  final Discharge? loading;
  final Discharge? discharge;
  final Cargo? cargo;
  final Consignee? shipper;
  final Consignee? consignee;
  final Rating? rating;
  final dynamic negotiationOrOrderApprovedAt;
  final dynamic orderRejectedAt;
  final dynamic orderCanceledAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.status,
    this.transactionId,
    this.customerCompanyName,
    this.vessel,
    this.loading,
    this.discharge,
    this.cargo,
    this.shipper,
    this.consignee,
    this.rating,
    this.negotiationOrOrderApprovedAt,
    this.orderRejectedAt,
    this.orderCanceledAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        status: json["status"],
        transactionId: json["transaction_id"],
        customerCompanyName: json["customer_company_name"],
        vessel: json["vessel"] == null ? null : Vessel.fromMap(json["vessel"]),
        loading:
            json["loading"] == null ? null : Discharge.fromMap(json["loading"]),
        discharge: json["discharge"] == null
            ? null
            : Discharge.fromMap(json["discharge"]),
        cargo: json["cargo"] == null ? null : Cargo.fromMap(json["cargo"]),
        shipper:
            json["shipper"] == null ? null : Consignee.fromMap(json["shipper"]),
        consignee: json["consignee"] == null
            ? null
            : Consignee.fromMap(json["consignee"]),
        rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
        negotiationOrOrderApprovedAt: json["negotiation_or_order_approved_at"],
        orderRejectedAt: json["order_rejected_at"],
        orderCanceledAt: json["order_canceled_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "transaction_id": transactionId,
        "customer_company_name": customerCompanyName,
        "vessel": vessel?.toMap(),
        "loading": loading?.toMap(),
        "discharge": discharge?.toMap(),
        "cargo": cargo?.toMap(),
        "shipper": shipper?.toMap(),
        "consignee": consignee?.toMap(),
        "rating": rating?.toMap(),
        "negotiation_or_order_approved_at": negotiationOrOrderApprovedAt,
        "order_rejected_at": orderRejectedAt,
        "order_canceled_at": orderCanceledAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Cargo {
  final String? description;
  final String? weight;

  Cargo({
    this.description,
    this.weight,
  });

  factory Cargo.fromJson(String str) => Cargo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cargo.fromMap(Map<String, dynamic> json) => Cargo(
        description: json["description"],
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "weight": weight,
      };
}

class Consignee {
  final String? name;
  final String? address;

  Consignee({
    this.name,
    this.address,
  });

  factory Consignee.fromJson(String str) => Consignee.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Consignee.fromMap(Map<String, dynamic> json) => Consignee(
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "address": address,
      };
}

class Discharge {
  final String? port;
  final DateTime? date;

  Discharge({
    this.port,
    this.date,
  });

  factory Discharge.fromJson(String str) => Discharge.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Discharge.fromMap(Map<String, dynamic> json) => Discharge(
        port: json["port"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "port": port,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}

class Rating {
  final dynamic star;
  final dynamic review;

  Rating({
    this.star,
    this.review,
  });

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        star: json["star"],
        review: json["review"],
      );

  Map<String, dynamic> toMap() => {
        "star": star,
        "review": review,
      };
}

class Vessel {
  final String? vesselName;
  final double? vesselLat;
  final double? vesselLon;
  final String? vesselVtsSpeedKnot;
  final String? vesselCalcSpeedKnot;
  final String? vesselHeadingDegree;
  final DateTime? pmlLastUpdatedAt;

  Vessel({
    this.vesselName,
    this.vesselLat,
    this.vesselLon,
    this.vesselVtsSpeedKnot,
    this.vesselCalcSpeedKnot,
    this.vesselHeadingDegree,
    this.pmlLastUpdatedAt,
  });

  factory Vessel.fromJson(String str) => Vessel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vessel.fromMap(Map<String, dynamic> json) => Vessel(
        vesselName: json["vessel_name"],
        vesselLat: json["vessel_lat"]?.toDouble(),
        vesselLon: json["vessel_lon"]?.toDouble(),
        vesselVtsSpeedKnot: json["vessel_vts_speed_knot"],
        vesselCalcSpeedKnot: json["vessel_calc_speed_knot"],
        vesselHeadingDegree: json["vessel_heading_degree"],
        pmlLastUpdatedAt: json["pml_last_updated_at"] == null
            ? null
            : DateTime.parse(json["pml_last_updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "vessel_name": vesselName,
        "vessel_lat": vesselLat,
        "vessel_lon": vesselLon,
        "vessel_vts_speed_knot": vesselVtsSpeedKnot,
        "vessel_calc_speed_knot": vesselCalcSpeedKnot,
        "vessel_heading_degree": vesselHeadingDegree,
        "pml_last_updated_at": pmlLastUpdatedAt?.toIso8601String(),
      };
}
