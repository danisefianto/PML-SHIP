import 'dart:convert';

class WeatherResponseModel {
  final List<LocationWeather> locations;

  WeatherResponseModel({
    required this.locations,
  });

  factory WeatherResponseModel.fromJson(String str) =>
      WeatherResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherResponseModel.fromMap(List<dynamic> json) =>
      WeatherResponseModel(
        locations: List<LocationWeather>.from(
            json.map((x) => LocationWeather.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "locations": List<dynamic>.from(locations.map((x) => x.toMap())),
      };
}

class LocationWeather {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final DailyUnits dailyUnits;
  final Daily daily;
  final int? locationId;

  LocationWeather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.dailyUnits,
    required this.daily,
    this.locationId,
  });

  factory LocationWeather.fromMap(Map<String, dynamic> json) => LocationWeather(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"]?.toDouble(),
        dailyUnits: DailyUnits.fromMap(json["daily_units"]),
        daily: Daily.fromMap(json["daily"]),
        locationId: json["location_id"],
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
        "location_id": locationId,
      };
}

class Daily {
  final List<DateTime> time;
  final List<int> weatherCode;
  final List<double> temperature2MMax;
  final List<double> temperature2MMin;
  final List<double> windSpeed10MMax;
  final List<int> windDirection10MDominant;

  Daily({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.windSpeed10MMax,
    required this.windDirection10MDominant,
  });

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weatherCode: List<int>.from(json["weather_code"].map((x) => x)),
        temperature2MMax: List<double>.from(
            json["temperature_2m_max"].map((x) => x?.toDouble())),
        temperature2MMin: List<double>.from(
            json["temperature_2m_min"].map((x) => x?.toDouble())),
        windSpeed10MMax: List<double>.from(
            json["wind_speed_10m_max"].map((x) => x?.toDouble())),
        windDirection10MDominant:
            List<int>.from(json["wind_direction_10m_dominant"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "time": List<dynamic>.from(time.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "weather_code": List<dynamic>.from(weatherCode.map((x) => x)),
        "temperature_2m_max":
            List<dynamic>.from(temperature2MMax.map((x) => x)),
        "temperature_2m_min":
            List<dynamic>.from(temperature2MMin.map((x) => x)),
        "wind_speed_10m_max": List<dynamic>.from(windSpeed10MMax.map((x) => x)),
        "wind_direction_10m_dominant":
            List<dynamic>.from(windDirection10MDominant.map((x) => x)),
      };
}

class DailyUnits {
  final String time;
  final String weatherCode;
  final String temperature2MMax;
  final String temperature2MMin;
  final String windSpeed10MMax;
  final String windDirection10MDominant;

  DailyUnits({
    required this.time,
    required this.weatherCode,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.windSpeed10MMax,
    required this.windDirection10MDominant,
  });

  factory DailyUnits.fromJson(String str) =>
      DailyUnits.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyUnits.fromMap(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        weatherCode: json["weather_code"],
        temperature2MMax: json["temperature_2m_max"],
        temperature2MMin: json["temperature_2m_min"],
        windSpeed10MMax: json["wind_speed_10m_max"],
        windDirection10MDominant: json["wind_direction_10m_dominant"],
      );

  Map<String, dynamic> toMap() => {
        "time": time,
        "weather_code": weatherCode,
        "temperature_2m_max": temperature2MMax,
        "temperature_2m_min": temperature2MMin,
        "wind_speed_10m_max": windSpeed10MMax,
        "wind_direction_10m_dominant": windDirection10MDominant,
      };
}
