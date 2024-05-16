import 'package:meta/meta.dart';
import 'dart:convert';

class PortResponseModel {
  final List<PortData> data;

  PortResponseModel({
    required this.data,
  });

  factory PortResponseModel.fromJson(String str) =>
      PortResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PortResponseModel.fromMap(Map<String, dynamic> json) =>
      PortResponseModel(
        data: List<PortData>.from(json["data"].map((x) => PortData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class PortData {
  final int id;
  final String name;
  final String address;
  final String countryCode;
  final String unlocode;
  final String latitude;
  final String longitude;
  final String openTime;
  final String closeTime;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  PortData({
    required this.id,
    required this.name,
    required this.address,
    required this.countryCode,
    required this.unlocode,
    required this.latitude,
    required this.longitude,
    required this.openTime,
    required this.closeTime,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PortData.fromJson(String str) => PortData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PortData.fromMap(Map<String, dynamic> json) => PortData(
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
