import 'dart:convert';

class UpdateOrderStatusResponseModel {
  final String status;
  final String message;
  final Data? data;

  UpdateOrderStatusResponseModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory UpdateOrderStatusResponseModel.fromJson(String str) =>
      UpdateOrderStatusResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateOrderStatusResponseModel.fromMap(Map<String, dynamic> json) =>
      UpdateOrderStatusResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
      };
}

class Data {
  final String status;
  final String transactionId;
  final String customerCompanyName;
  final String vesselName;
  final Discharge loading;
  final Discharge discharge;
  final Cargo cargo;
  final Consignee shipper;
  final Consignee consignee;
  final List<Document> documents;
  final Payment payment;
  final Rating rating;
  final DateTime? negotiationOrOrderApprovedAt;
  final DateTime? orderRejectedAt;
  final DateTime? orderCanceledAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.status,
    required this.transactionId,
    required this.customerCompanyName,
    required this.vesselName,
    required this.loading,
    required this.discharge,
    required this.cargo,
    required this.shipper,
    required this.consignee,
    required this.documents,
    required this.payment,
    required this.rating,
    this.negotiationOrOrderApprovedAt,
    this.orderRejectedAt,
    this.orderCanceledAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        status: json["status"],
        transactionId: json["transaction_id"],
        customerCompanyName: json["customer_company_name"],
        vesselName: json["vessel_name"],
        loading: Discharge.fromMap(json["loading"]),
        discharge: Discharge.fromMap(json["discharge"]),
        cargo: Cargo.fromMap(json["cargo"]),
        shipper: Consignee.fromMap(json["shipper"]),
        consignee: Consignee.fromMap(json["consignee"]),
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromMap(x))),
        payment: Payment.fromMap(json["payment"]),
        rating: Rating.fromMap(json["rating"]),
        negotiationOrOrderApprovedAt:
            json["negotiation_or_order_approved_at"] != null
                ? DateTime.parse(json["negotiation_or_order_approved_at"])
                : null,
        orderRejectedAt: json["order_rejected_at"] != null
            ? DateTime.parse(json["order_rejected_at"])
            : null,
        orderCanceledAt: json["order_canceled_at"] != null
            ? DateTime.parse(json["order_canceled_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "transaction_id": transactionId,
        "customer_company_name": customerCompanyName,
        "vessel_name": vesselName,
        "loading": loading.toMap(),
        "discharge": discharge.toMap(),
        "cargo": cargo.toMap(),
        "shipper": shipper.toMap(),
        "consignee": consignee.toMap(),
        "documents": List<dynamic>.from(documents.map((x) => x.toMap())),
        "payment": payment.toMap(),
        "rating": rating.toMap(),
        "negotiation_or_order_approved_at":
            negotiationOrOrderApprovedAt?.toIso8601String(),
        "order_rejected_at": orderRejectedAt?.toIso8601String(),
        "order_canceled_at": orderCanceledAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Cargo {
  final String description;
  final String weight;

  Cargo({
    required this.description,
    required this.weight,
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
  final String name;
  final String address;

  Consignee({
    required this.name,
    required this.address,
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
  final String port;
  final DateTime date;

  Discharge({
    required this.port,
    required this.date,
  });

  factory Discharge.fromJson(String str) => Discharge.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Discharge.fromMap(Map<String, dynamic> json) => Discharge(
        port: json["port"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "port": port,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

class Document {
  final dynamic documentName;
  final String documentType;
  final DateTime? maxInputDocumentAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Document({
    required this.documentName,
    required this.documentType,
    this.maxInputDocumentAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Document.fromJson(String str) => Document.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Document.fromMap(Map<String, dynamic> json) => Document(
        documentName: json["document_name"],
        documentType: json["document_type"],
        maxInputDocumentAt: json["max_input_document_at"] != null
            ? DateTime.parse(json["max_input_document_at"])
            : null,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "document_name": documentName,
        "document_type": documentType,
        "max_input_document_at": maxInputDocumentAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Payment {
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;
  final int tax;
  final int totalBill;
  final int? cumulativePaid;

  Payment({
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
    required this.tax,
    required this.totalBill,
    this.cumulativePaid,
  });

  factory Payment.fromJson(String str) => Payment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Payment.fromMap(Map<String, dynamic> json) => Payment(
        shippingCost: json["shipping_cost"],
        handlingCost: json["handling_cost"],
        biayaParkirPelabuhan: json["biaya_parkir_pelabuhan"],
        tax: json["tax"],
        totalBill: json["total_bill"],
        cumulativePaid: json["cumulative_paid"],
      );

  Map<String, dynamic> toMap() => {
        "shipping_cost": shippingCost,
        "handling_cost": handlingCost,
        "biaya_parkir_pelabuhan": biayaParkirPelabuhan,
        "tax": tax,
        "total_bill": totalBill,
        "cumulative_paid": cumulativePaid,
      };
}

class Rating {
  final int? star;
  final String? review;

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
