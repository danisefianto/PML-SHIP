import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/add_conference_request_model.dart';
import '../models/request/new_check_quotation_request_model.dart';
import '../models/request/new_order_request_model.dart';
import '../models/request/weather_request_model.dart';
import '../models/response/add_conference_response_model.dart';
import '../models/response/new_check_quotation_response_model.dart';
import '../models/response/new_order_response_model.dart';
import '../models/response/port_response_model.dart';
import '../models/response/summary_order_response_model.dart';
import '../models/response/weather_response_model.dart';
import 'auth_local_datasource.dart';

class OrderRemoteDatasource {
  Future<Either<String, PortResponseModel>> getPorts() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/ports'),
      headers: {
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Right(PortResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  Future<Either<String, WeatherResponseModel>> fetchWeatherData(
      WeatherRequestModel request) async {
    final url = Uri.parse(
            '${Variables.weatherApiUrl}${Variables.weatherApiVersion}/forecast')
        .replace(queryParameters: request.toQueryParameters());

    log("Request URL: $url");

    final response = await http.get(url);

    log("Response Status Code: ${response.statusCode}");
    // log("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final weatherResponse = WeatherResponseModel.fromJson(response.body);
      return Right(weatherResponse);
    } else {
      return Left('Failed to fetch weather data: ${response.reasonPhrase}');
    }
  }

  Future<Either<String, NewCheckQuotationResponseModel>> newcheckQuotation(
      NewCheckQuotationRequestModel newCheckQuotationRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/checkQuotation'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: newCheckQuotationRequestModel.toJson(),
    );
    log('request: ${newCheckQuotationRequestModel.toJson()}');
    log("resposen: ${response.statusCode}");
    // log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(NewCheckQuotationResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to check quotation');
    }
  }

  Future<Either<String, NewOrderResponseModel>> newOrder(
      NewOrderRequestModel newOrderRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/order'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: newOrderRequestModel.toJson(),
    );
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 201) {
      return Right(NewOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to create order');
    }
  }

  Future<Either<String, SummaryOrderResponseModel>> getSummaryOrder(
      String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/orders/$transactionId'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");
    if (response.statusCode == 200) {
      return Right(SummaryOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Summary order error');
    }
  }

  Future<Either<String, AddConferenceResponseModel>> addConference(
      AddConferenceRequestModel addConferenceRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/addConference'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: addConferenceRequestModel.toJson(),
    );
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");
    if (response.statusCode == 201) {
      return Right(AddConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left(
          'Failed to add conference data. Check your data again.');
    }
  }
}
