const List<String> _dayIndonesianNames = [
  'Minggu',
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu'
];

const List<String> _dayInternationalNames = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];

const List<String> _monthIndonesianNames = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember'
];

const List<String> _monthInternationalNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

extension DateTimeExt on DateTime {
  String toFormattedIndonesianLongDate() {
    String dayName = _dayIndonesianNames[weekday - 1];
    return '$dayName, $day ${toFormattedIndonesianMonth()} $year';
    // Selasa, 31 Desember 2024
  }

  String toFormattedInternationalLongDate() {
    String dayName = _dayInternationalNames[weekday - 1];
    return '$dayName, $day ${toFormattedInternationalMonth()} $year';
    // Tuesday, 31 December 2024
  }

  String toFormattedIndonesianShortDate() {
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    return '$day-$month-$year';
    // 02-05-2024
    // 31-05-2024
    // 02-12-2024
    // 31-12-2024
  }

  String toFormattedInternationalShortDate() {
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    return '$year-$month-$day';
    // 2024-12-31
    // 2024-12-02
    // 2024-05-31
    // 2024-05-02
  }

  String toFormattedIndonesianMonth() {
    return _monthIndonesianNames[month - 1];
    // Agustus
  }

  String toFormattedInternationalMonth() {
    return _monthInternationalNames[month - 1];
    // August
  }

  String toFormattedUTC7Time() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
    // 07:59 WIB
  }

  String toFormattedUTC8Time() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute WITA';
    // 08:59 WITA
  }

  String toFormattedUTC9Time() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIT';
    // 09:59 WIT
  }
}
