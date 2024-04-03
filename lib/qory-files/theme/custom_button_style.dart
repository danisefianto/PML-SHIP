import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillIndigoTL16 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.indigo400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor:
            Color(0xFF4682B4), // Sesuaikan warna primer yang diinginkan di sini
        // Tambahkan konfigurasi lain yang diperlukan
      );
  static final ButtonStyle fillIndigo1 = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    // Additional properties as needed
  );

  static ButtonStyle get fillPrimaryTL16 => ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF4682B4), // Example primary color
        textStyle: TextStyle(
          fontSize: 16, // Example font size
        ),
        padding: EdgeInsets.symmetric(
            vertical: 16, horizontal: 16), // Example padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Example border radius
        ),
      );
}
