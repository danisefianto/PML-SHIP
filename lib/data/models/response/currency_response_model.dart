import 'dart:convert';

class CurrencyResponseModel {
  final String status;
  final String message;
  final Data data;

  CurrencyResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CurrencyResponseModel.fromJson(String str) =>
      CurrencyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrencyResponseModel.fromMap(Map<String, dynamic> json) =>
      CurrencyResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final int id;
  final String baseCurrency;
  final String currencies;
  final String rate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.baseCurrency,
    required this.currencies,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        baseCurrency: json["base_currency"],
        currencies: json["currencies"],
        rate: json["rate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "base_currency": baseCurrency,
        "currencies": currencies,
        "rate": rate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
