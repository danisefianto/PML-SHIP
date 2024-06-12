import 'dart:convert';

class UpdateDocumentResponseModel {
  final Data data;

  UpdateDocumentResponseModel({
    required this.data,
  });

  factory UpdateDocumentResponseModel.fromJson(String str) =>
      UpdateDocumentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateDocumentResponseModel.fromMap(Map<String, dynamic> json) =>
      UpdateDocumentResponseModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final String status;
  final dynamic shippingInstructionDocumentUrl;
  final dynamic billOfLadingDocumentUrl;
  final dynamic cargoManifestDocumentUrl;
  final dynamic timeSheetDocumentUrl;
  final dynamic draughtSurveyDocumentUrl;

  Data({
    required this.status,
    required this.shippingInstructionDocumentUrl,
    required this.billOfLadingDocumentUrl,
    required this.cargoManifestDocumentUrl,
    required this.timeSheetDocumentUrl,
    required this.draughtSurveyDocumentUrl,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        status: json["status"],
        shippingInstructionDocumentUrl:
            json["shipping_instruction_document_url"],
        billOfLadingDocumentUrl: json["bill_of_lading_document_url"],
        cargoManifestDocumentUrl: json["cargo_manifest_document_url"],
        timeSheetDocumentUrl: json["time_sheet_document_url"],
        draughtSurveyDocumentUrl: json["draught_survey_document_url"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "shipping_instruction_document_url": shippingInstructionDocumentUrl,
        "bill_of_lading_document_url": billOfLadingDocumentUrl,
        "cargo_manifest_document_url": cargoManifestDocumentUrl,
        "time_sheet_document_url": timeSheetDocumentUrl,
        "draught_survey_document_url": draughtSurveyDocumentUrl,
      };
}
