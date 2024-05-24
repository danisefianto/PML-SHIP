import 'dart:convert';

class CurrencyResponseModel {
  final int id;
  final String baseCurrency;
  final String currencies;
  final String rate;
  final DateTime createdAt;
  final DateTime updatedAt;

  CurrencyResponseModel({
    required this.id,
    required this.baseCurrency,
    required this.currencies,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CurrencyResponseModel.fromJson(String str) =>
      CurrencyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrencyResponseModel.fromMap(Map<String, dynamic> json) =>
      CurrencyResponseModel(
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
