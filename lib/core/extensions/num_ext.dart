import 'package:intl/intl.dart';

extension NumExt on num {
  String get currencyEYDFormatRp => NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp',
        decimalDigits: 0,
      ).format(this);
  // Output: Rp123.456

// TODO: Output 123.456 IDR
  // String get currencyISO4217FormatRp => NumberFormat.currency(
  //       locale: 'id_ID',
  //       symbol: 'IDR',
  //       decimalDigits: 0,
  //     ).format(this);
}
