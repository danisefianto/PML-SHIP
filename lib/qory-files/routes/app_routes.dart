import 'package:flutter/material.dart';
import '../presentation/landing_page_screen/landing_page_screen.dart';
import '../presentation/cover_screen/cover_screen.dart';
import '../presentation/halaman_riwayat_one_screen/halaman_riwayat_one_screen.dart'; // Import file yang berisi HalamanRiwayatonescreen

class AppRoutes {
  static const String landingPageScreen = '/landing_page_screen';
  static const String coverScreen = '/cover_screen';
  static const String halamanRiwayatonescreen =
      '/halaman_riwayat_one_screen'; // Definisikan halamanRiwayatonescreen di sini

  static Map<String, WidgetBuilder> routes = {
    landingPageScreen: (context) => const LandingPageScreen(),
    coverScreen: (context) => const CoverScreen(),
    halamanRiwayatonescreen: (context) =>
        const HalamanRiwayatonescreen(), // Tambahkan halamanRiwayatonescreen ke dalam map routes
  };
}
