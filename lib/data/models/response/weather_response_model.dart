import 'dart:convert';

class WeatherResponseModel {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final int elevation;
  final DailyUnits dailyUnits;
  final Daily daily;

  WeatherResponseModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherResponseModel.fromJson(String str) =>
      WeatherResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherResponseModel.fromMap(Map<String, dynamic> json) =>
      WeatherResponseModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        dailyUnits: DailyUnits.fromMap(json["daily_units"]),
        daily: Daily.fromMap(json["daily"]),
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "daily_units": dailyUnits.toMap(),
        "daily": daily.toMap(),
      };
}

class Daily {
  final List<DateTime> time;
  final List<int> weatherCode;

  Daily({
    required this.time,
    required this.weatherCode,
  });

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weatherCode: List<int>.from(json["weather_code"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "time": List<dynamic>.from(time.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "weather_code": List<dynamic>.from(weatherCode.map((x) => x)),
      };
}

class DailyUnits {
  final String time;
  final String weatherCode;

  DailyUnits({
    required this.time,
    required this.weatherCode,
  });

  factory DailyUnits.fromJson(String str) =>
      DailyUnits.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyUnits.fromMap(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        weatherCode: json["weather_code"],
      );

  Map<String, dynamic> toMap() => {
        "time": time,
        "weather_code": weatherCode,
      };
}
