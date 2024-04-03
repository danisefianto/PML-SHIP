import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo20001,
        // Add any other decoration properties you need for fillIndigo
      );

  static const fillBlueGray = BoxDecoration(
    color: Colors.blueGrey, // Change color to your desired color
  );

  static BoxDecoration get fillTeal => BoxDecoration(
        color: Color(0xFFDBEFEF),
        border: Border.all(
          color: Color(0xFF4682B4),
          width: 1, // Adjust the width of the border as needed
        ),
      );

  // New fill decorations
  static BoxDecoration get fillGreen => const BoxDecoration(
        color: Colors.green, // Change color to your desired color
      );

  static BoxDecoration get fillOrange => const BoxDecoration(
        color: Colors.orange, // Change color to your desired color
      );

  // Border radius
  static const BorderRadius roundedBorder10 =
      BorderRadius.all(Radius.circular(10));
  static const BorderRadius roundedBorder20 =
      BorderRadius.all(Radius.circular(20));

  // Outline decorations
  static final BoxDecoration outlinePrimary2 = BoxDecoration(
    border: Border.all(
      color: Colors.blue, // Sesuaikan warna sesuai kebutuhan
      width: 2.0, // Sesuaikan lebar border sesuai kebutuhan
    ),
    borderRadius: const BorderRadius.all(
        Radius.circular(10.0)), // Sesuaikan radius border sesuai kebutuhan
  );

  // Getter untuk properti strokeAlignInside, strokeAlignCenter, dan strokeAlignOutside
  static double get strokeAlignInside => BorderSide.strokeAlignInside;
  static double get strokeAlignCenter => BorderSide.strokeAlignCenter;
  static double get strokeAlignOutside => BorderSide.strokeAlignOutside;

  // New properties
  static const TextStyle bodyLarge17 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    // Add other style properties as needed
  );

  static BoxDecoration get fillPrimary1 => const BoxDecoration(
        color: Color(0xFF4682B4), // Change color to your desired color
        // Add any other decoration properties you need for fillPrimary1
      );
}
