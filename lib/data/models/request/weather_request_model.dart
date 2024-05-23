class WeatherRequestModel {
  final String latitude;
  final String longitude;
  final String startDate;
  final String endDate;

  WeatherRequestModel({
    required this.latitude,
    required this.longitude,
    required this.startDate,
    required this.endDate,
  });

  Map<String, String> toQueryParameters() {
    return {
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}
