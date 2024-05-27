import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../../core/constants/variables.dart';
import '../models/request/weather_request_model.dart';
import '../models/response/weather_response_model.dart';

class WeatherRemoteDataSource {
  Future<Either<String, WeatherResponseModel>> fetchWeatherData(
      WeatherRequestModel request) async {
    try {
      final url = Uri.parse(
              '${Variables.weatherApiUrl}${Variables.weatherApiVersion}/forecast')
          .replace(queryParameters: request.toQueryParameters());

      log("Request URL: $url");

      final response = await http.get(url);

      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final weatherResponse = WeatherResponseModel.fromJson(response.body);
        return Right(weatherResponse);
      } else {
        return Left('Failed to fetch weather data: ${response.reasonPhrase}');
      }
    } catch (e) {
      log("Exception: $e");
      return Left('Error: $e');
    }
  }
}
