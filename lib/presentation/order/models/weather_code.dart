import 'package:flutter/material.dart';
import '../../../core/core.dart';

class WeatherCode {
  final int code;
  final String description;
  final Image icon;

  WeatherCode({
    required this.code,
    required this.description,
    required this.icon,
  });
}

// Define a list of weather codes and their corresponding icons
final List<WeatherCode> weatherCodes = [
  WeatherCode(
    code: 0,
    description: 'Cerah / Clear Skies',
    icon: Assets.icon.weather.id.am.cerahAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 1,
    description: 'Cerah Berawan / Partly Cloudy',
    icon: Assets.icon.weather.id.am.cerahBerawanAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 2,
    description: 'Cerah Berawan / Partly Cloudy',
    icon: Assets.icon.weather.id.am.cerahBerawanAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 3,
    description: 'Berawan / Mostly Cloudy',
    icon: Assets.icon.weather.id.am.berawanAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 4,
    description: 'Berawan Tebal / Overcast',
    icon: Assets.icon.weather.id.am.berawanTebalAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 5,
    description: 'Udara Kabur / Haze',
    icon: Assets.icon.weather.id.am.udaraKaburAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 10,
    description: 'Asap / Smoke',
    icon: Assets.icon.weather.id.am.asapAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 45,
    description: 'Kabut / Fog',
    icon: Assets.icon.weather.id.am.kabutAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 60,
    description: 'Hujan Ringan / Light Rain',
    icon: Assets.icon.weather.id.am.hujanRinganAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 61,
    description: 'Hujan Sedang / Rain',
    icon: Assets.icon.weather.id.am.hujanAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 63,
    description: 'Hujan Lebat / Heavy Rain',
    icon: Assets.icon.weather.id.am.hujanLebatAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 80,
    description: 'Hujan Lokal / Isolated Shower',
    icon: Assets.icon.weather.id.am.hujanLokalAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 95,
    description: 'Hujan Petir / Severe Thunderstorm',
    icon: Assets.icon.weather.id.am.hujanPetirAm.image(
      height: 20,
    ),
  ),
  WeatherCode(
    code: 97,
    description: 'Hujan Petir / Severe Thunderstorm',
    icon: Assets.icon.weather.id.am.hujanPetirAm.image(
      height: 20,
    ),
  ),
];
