import 'dart:convert';

class CurrencyResponseModel {
  final CurrencyData data;

  CurrencyResponseModel({
    required this.data,
  });

  factory CurrencyResponseModel.fromJson(String str) =>
      CurrencyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrencyResponseModel.fromMap(Map<String, dynamic> json) =>
      CurrencyResponseModel(
        data: CurrencyData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class CurrencyData {
  final double idr;

  CurrencyData({
    required this.idr,
  });

  factory CurrencyData.fromJson(String str) =>
      CurrencyData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrencyData.fromMap(Map<String, dynamic> json) => CurrencyData(
        idr: json["IDR"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "IDR": idr,
      };
}
