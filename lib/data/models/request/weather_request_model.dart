class WeatherRequestModel {
  final List<String> latitude;
  final List<String> longitude;
  final List<String> daily;
  final String timezone;
  final String startDate;
  final String endDate;

  WeatherRequestModel({
    required this.latitude,
    required this.longitude,
    required this.daily,
    required this.timezone,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toQueryParameters() {
    return {
      'latitude': latitude.join(','),
      'longitude': longitude.join(','),
      'daily': daily.join(','),
      'timezone': timezone,
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}
