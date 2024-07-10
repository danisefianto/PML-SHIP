import 'dart:convert';

class OrderDetailResponseModel {
  final String? status;
  final String? message;
  final Data? data;

  OrderDetailResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory OrderDetailResponseModel.fromJson(String str) =>
      OrderDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      OrderDetailResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final String? status;
  final String? transactionId;
  final String? customerCompanyName;
  final Vessel? vessel;
  final Discharge? loading;
  final Discharge? discharge;
  final Cargo? cargo;
  final Consignee? shipper;
  final Consignee? consignee;
  final List<Document>? documents;
  final DataPayment? payment;
  final Rating? rating;
  final DateTime? negotiationOrOrderApprovedAt;
  final dynamic orderRejectedAt;
  final dynamic orderCanceledAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.status,
    this.transactionId,
    this.customerCompanyName,
    this.vessel,
    this.loading,
    this.discharge,
    this.cargo,
    this.shipper,
    this.consignee,
    this.documents,
    this.payment,
    this.rating,
    this.negotiationOrOrderApprovedAt,
    this.orderRejectedAt,
    this.orderCanceledAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        documents: json["documents"] == null
            ? []
            : List<Document>.from(
                json["documents"]!.map((x) => Document.fromMap(x))),
        payment: json["payment"] == null
            ? null
            : DataPayment.fromMap(json["payment"]),
        rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
        negotiationOrOrderApprovedAt:
            json["negotiation_or_order_approved_at"] == null
                ? null
                : DateTime.parse(json["negotiation_or_order_approved_at"]),
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
        "documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x.toMap())),
        "payment": payment?.toMap(),
        "rating": rating?.toMap(),
        "negotiation_or_order_approved_at":
            negotiationOrOrderApprovedAt?.toIso8601String(),
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

class Document {
  final String? documentName;
  final String? documentType;
  final dynamic maxInputDocumentAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Document({
    this.documentName,
    this.documentType,
    this.maxInputDocumentAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Document.fromJson(String str) => Document.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Document.fromMap(Map<String, dynamic> json) => Document(
        documentName: json["document_name"],
        documentType: json["document_type"],
        maxInputDocumentAt: json["max_input_document_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "document_name": documentName,
        "document_type": documentType,
        "max_input_document_at": maxInputDocumentAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class DataPayment {
  final int? shippingCost;
  final int? handlingCost;
  final int? biayaParkirPelabuhan;
  final int? tax;
  final int? totalBill;
  final dynamic cumulativePaid;
  final List<PaymentElement>? payments;

  DataPayment({
    this.shippingCost,
    this.handlingCost,
    this.biayaParkirPelabuhan,
    this.tax,
    this.totalBill,
    this.cumulativePaid,
    this.payments,
  });

  factory DataPayment.fromJson(String str) =>
      DataPayment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataPayment.fromMap(Map<String, dynamic> json) => DataPayment(
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
        tax: json["tax"],
        totalBill: json["total_bill"],
        cumulativePaid: json["cumulative_paid"],
        payments: json["payments"] == null
            ? []
            : List<PaymentElement>.from(
                json["payments"]!.map((x) => PaymentElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
        "tax": tax,
        "total_bill": totalBill,
        "cumulative_paid": cumulativePaid,
        "payments": payments == null
            ? []
            : List<dynamic>.from(payments!.map((x) => x.toMap())),
      };
}

class PaymentElement {
  final DateTime? paymentDate;
  final DateTime? paymentDueDate;
  final int? paymentAmount;
  final String? paymentProofDocument;
  final int? installmentNumber;
  final dynamic totalInstallments;
  final String? paymentStatus;
  final DateTime? approvedAt;
  final dynamic rejectedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentElement({
    this.paymentDate,
    this.paymentDueDate,
    this.paymentAmount,
    this.paymentProofDocument,
    this.installmentNumber,
    this.totalInstallments,
    this.paymentStatus,
    this.approvedAt,
    this.rejectedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentElement.fromJson(String str) =>
      PaymentElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentElement.fromMap(Map<String, dynamic> json) => PaymentElement(
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.parse(json["payment_date"]),
        paymentDueDate: json["payment_due_date"] == null
            ? null
            : DateTime.parse(json["payment_due_date"]),
        paymentAmount: json["payment_amount"],
        paymentProofDocument: json["payment_proof_document"],
        installmentNumber: json["installment_number"],
        totalInstallments: json["total_installments"],
        paymentStatus: json["payment_status"],
        approvedAt: json["approved_at"] == null
            ? null
            : DateTime.parse(json["approved_at"]),
        rejectedAt: json["rejected_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "payment_date":
            "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
        "payment_due_date": paymentDueDate?.toIso8601String(),
        "payment_amount": paymentAmount,
        "payment_proof_document": paymentProofDocument,
        "installment_number": installmentNumber,
        "total_installments": totalInstallments,
        "payment_status": paymentStatus,
        "approved_at": approvedAt?.toIso8601String(),
        "rejected_at": rejectedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
