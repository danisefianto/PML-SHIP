// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core/core.dart';

class WeatherCode {
  final int code;
  final String englishDescription;
  final String indonesianDescription;
  final Image icon;

  WeatherCode({
    required this.code,
    required this.englishDescription,
    required this.indonesianDescription,
    required this.icon,
  });
}

// Define a list of weather codes and their corresponding icons
final List<WeatherCode> weatherCodes = [
  WeatherCode(
    code: 0,
    indonesianDescription: 'Cerah',
    englishDescription: 'Clear Skies',
    icon: Assets.icon.weather.id.am.cerahAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 1,
    indonesianDescription: 'Cerah Berawan',
    englishDescription: 'Partly Cloudy',
    icon: Assets.icon.weather.id.am.cerahBerawanAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 2,
    indonesianDescription: 'Cerah Berawan',
    englishDescription: 'Partly Cloudy',
    icon: Assets.icon.weather.id.am.cerahBerawanAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 3,
    indonesianDescription: 'Berawan',
    englishDescription: 'Mostly Cloudy',
    icon: Assets.icon.weather.id.am.berawanAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 4,
    indonesianDescription: 'Berawan Tebal',
    englishDescription: 'Overcast',
    icon: Assets.icon.weather.id.am.berawanTebalAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 5,
    indonesianDescription: 'Udara Kabur',
    englishDescription: 'Haze',
    icon: Assets.icon.weather.id.am.udaraKaburAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 10,
    indonesianDescription: 'Asap',
    englishDescription: 'Smoke',
    icon: Assets.icon.weather.id.am.asapAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 45,
    indonesianDescription: 'Kabut',
    englishDescription: 'Fog',
    icon: Assets.icon.weather.id.am.kabutAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 51,
    indonesianDescription: 'Gerimis',
    englishDescription: 'Drizzle',
    icon: Assets.icon.weather.id.am.hujanRinganAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 53,
    indonesianDescription: 'Gerimis',
    englishDescription: 'Drizzle',
    icon: Assets.icon.weather.id.am.hujanRinganAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 60,
    indonesianDescription: 'Hujan Ringan',
    englishDescription: 'Light Rain',
    icon: Assets.icon.weather.id.am.hujanRinganAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 61,
    indonesianDescription: 'Hujan Sedang',
    englishDescription: 'Rain',
    icon: Assets.icon.weather.id.am.hujanAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 63,
    indonesianDescription: 'Hujan Lebat',
    englishDescription: 'Heavy Rain',
    icon: Assets.icon.weather.id.am.hujanLebatAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 80,
    indonesianDescription: 'Hujan Lokal',
    englishDescription: 'Isolated Shower',
    icon: Assets.icon.weather.id.am.hujanLokalAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 95,
    indonesianDescription: 'Hujan Petir',
    englishDescription: 'Severe Thunderstorm',
    icon: Assets.icon.weather.id.am.hujanPetirAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 96,
    indonesianDescription: 'Hujan Petir',
    englishDescription: 'Severe Thunderstorm',
    icon: Assets.icon.weather.id.am.hujanPetirAm.image(
      width: 20,
    ),
  ),
  WeatherCode(
    code: 97,
    indonesianDescription: 'Hujan Petir',
    englishDescription: 'Severe Thunderstorm',
    icon: Assets.icon.weather.id.am.hujanPetirAm.image(
      width: 20,
    ),
  ),
];
