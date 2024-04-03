import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/theme/theme_helper.dart';

class PrimaryColors {
  static const Color gray400 = Color(0xFFCCCCCC);
  static const Color gray800 = Color(0xFF888888);
  // Definisikan warna lainnya sesuai kebutuhan
}

class CustomTextStyles {
  // Body text style
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
      );

  // Menambahkan properti labelMediumInter
  static TextStyle get labelMediumInter => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      );
  static const TextStyle bodysmalls = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    // Add other properties as needed
  );

  static const TextStyle bodyMediumInter13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter', // Sesuaikan dengan font family yang digunakan
  );
  static const TextStyle bodyMediumInterff000000 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xFF000000), // This is the color code ff000000 (black)
  );

  static const TextStyle labelLargeBlack900 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle bodySmallPoppinswhiteA700 = TextStyle(
    // Define your text style properties here
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    fontFamily: 'Poppins', // Assuming 'Poppins' is your font family
  );
  // Menambahkan properti bodySmall10
  static TextStyle get bodySmall10 => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        // Sesuaikan dengan kebutuhan lainnya
      );
  static TextStyle get bodySmallOnPrimaryContainer => const TextStyle(
        fontSize: 14, // Sesuaikan dengan ukuran yang diinginkan
        fontWeight: FontWeight.w400, // Sesuaikan dengan gaya yang diinginkan
        color: Colors.white, // Sesuaikan dengan warna yang diinginkan
      );
  static TextStyle get bodySmallWhiteA700_1 => const TextStyle(
      // Tambahkan properti sesuai dengan kebutuhan Anda
      );

  static TextStyle get bodySmallPoppins => TextStyle(
        fontWeight: FontWeight.normal, // Ketebalan font
        fontFamily: 'Poppins', // Jenis font
        color: Colors.black, // Warna teks
        // Atur properti teks sesuai kebutuhan lainnya
      );

  static TextStyle get bodyMediumGray600 => TextStyle(
        // Sesuaikan dengan gaya teks yang diinginkan
        color: Colors.grey[600],
        // Sesuaikan dengan ukuran font yang diinginkan
        fontSize: 16,
        // Sesuaikan dengan berat font yang diinginkan
        fontWeight: FontWeight.normal,
        // Sesuaikan dengan gaya font yang diinginkan
        fontStyle: FontStyle.normal,
        // Sesuaikan dengan spasi karakter yang diinginkan
        letterSpacing: 0.15,
        // Sesuaikan dengan ketinggian baris yang diinginkan
        height: 1.5,
      );

  // Properti baru
  static const TextStyle headlineMediumBlack900 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  // Headline text style
  static get headlineMediumBlack900Custom =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black900,
      );

  static get headlineSmallInter => theme.textTheme.headlineSmall!.inter;

  static get headlinesmallwhiteA700 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.whiteA700,
      );

  // Inter text style
  static get interBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 6, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w400,
      ).inter;

  // Label text style
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static get labelLargePoppins => theme.textTheme.labelLarge!.poppins.copyWith(
        fontWeight: FontWeight.w500,
      );

  static get labelLargePoppinsSemiBold =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        fontWeight: FontWeight.w600,
      );

  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static get labelLargeSemiBold13 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w600,
      );

  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w600,
      );

  static get labelLargewhiteA700Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );

  static get labelLargeWhiteA700_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );

  static get labelLargeff000000 => theme.textTheme.labelLarge!.copyWith(
        color: const Color(0XFF990000),
      );

  static get labelLargeff000000Bold => theme.textTheme.labelLarge!.copyWith(
        color: const Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );

  static get labelMediumInterCustom => theme.textTheme.labelMedium!.inter;

  static get labelMediumffe000000 => theme.textTheme.labelMedium!.copyWith(
        color: const Color(0XFF000000),
      );

  // Title text style
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20, // Sesuaikan dengan nilai yang diinginkan
      );

  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20, // Sesuaikan dengan nilai yang diinginkan
      );

  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumBlack9005emiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 16, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w600,
      );

  static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );

  static get titleMediumPoppinsBlack900 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.black900,
      );

  static get titleMediumPoppinsBlack900Medium =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.black900,
        fontSize: 16, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w500,
      );

  static get titleMediumPoppinsOnPrimaryContainer =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.primaryColor, // Sesuaikan dengan nilai yang diinginkan
        fontSize: 16, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w600,
      );

  static get titleMediumPoppinsOnPrimaryContainerSemiBold =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.primaryColor
            .withOpacity(1), // Sesuaikan dengan nilai yang diinginkan
        fontSize: 16, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w600,
      );

  static get titleMediumPoppinsWhiteA700 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumRobotoBlack900 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.black900,
        fontSize: 17, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w700,
      );

  static get titleMediumwhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w700,
      );

  static get titleMediumwhiteA70016 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16, // Sesuaikan dengan nilai yang diinginkan
      );

  static get titleSmallInter => theme.textTheme.titleSmall!.inter.copyWith(
        fontWeight: FontWeight.w700,
      );

  static get titleSmallInterBold => theme.textTheme.titleSmall!.inter.copyWith(
        fontSize: 15, // Sesuaikan dengan nilai yang diinginkan
        fontWeight: FontWeight.w700,
      );
  static TextStyle get bodysmallff000000_1 => const TextStyle(
      // Definisikan properti-properti sesuai kebutuhan
      );

  static TextStyle get bodysmallff000000 => const TextStyle(
      // Definisikan properti-properti sesuai kebutuhan
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(fontFamily: 'Roboto');
  }

  TextStyle get inter {
    return copyWith(fontFamily: 'Inter');
  }

  TextStyle get poppins {
    return copyWith(fontFamily: 'Poppins');
  }
}
