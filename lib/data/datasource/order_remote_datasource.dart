import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pml_ship/data/models/request/cancel_order_request_model.dart';

import '../../core/constants/variables.dart';
import '../models/request/add_conference_request_model.dart';
import '../models/request/check_quotation_request_model.dart';
import '../models/request/new_order_request_model.dart';
import '../models/request/weather_request_model.dart';
import '../models/response/add_conference_response_model.dart';
import '../models/response/new_check_quotation_response_model.dart';
import '../models/response/new_order_response_model.dart';
import '../models/response/order_detail_response_model.dart';
import '../models/response/port_response_model.dart';
import '../models/response/update_order_status_response_model.dart';
import '../models/response/weather_response_model.dart';
import 'auth_local_datasource.dart';

class OrderRemoteDatasource {
  Future<Either<String, PortResponseModel>> getPorts() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/ports');

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );

    // // Log the request
    // log('Request: $headers');
    // log('URL: $url');

    // // Log the response body
    // log('Response: ${response.body}');
    // log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(PortResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  Future<Either<String, WeatherResponseModel>> fetchWeatherData(
      WeatherRequestModel request) async {
    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    // URL
    final url = Uri.parse(
            '${Variables.weatherApiUrl}${Variables.weatherApiVersion}/forecast')
        .replace(queryParameters: request.toQueryParameters());

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Response: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final weatherResponse = WeatherResponseModel.fromJson(response.body);
      return Right(weatherResponse);
    } else {
      return Left('Failed to fetch weather data: ${response.reasonPhrase}');
    }
  }

  Future<Either<String, NewCheckQuotationResponseModel>> newcheckQuotation(
      CheckQuotationRequestModel requestModel) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/checkQuotation');

    // Send the request
    final response = await http.post(
      url,
      headers: headers,
      body: requestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Response: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(NewCheckQuotationResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to check quotation');
    }
  }

  Future<Either<String, NewOrderResponseModel>> newOrder(
      NewOrderRequestModel newOrderRequestModel) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/order');

    // Send the request
    final response = await http.post(
      url,
      headers: headers,
      body: newOrderRequestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Response: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 201) {
      return Right(NewOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to create order');
    }
  }

  Future<Either<String, OrderDetailResponseModel>> getSummaryOrder(
      String transactionId) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/orders/$transactionId');

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Response: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else {
      return const Left('Summary order error');
    }
  }

  Future<Either<String, AddConferenceResponseModel>> addConference(
      AddConferenceRequestModel addConferenceRequestModel) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/addConference');

    // Send the request
    final response = await http.post(
      url,
      headers: headers,
      body: addConferenceRequestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Response: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 201) {
      return Right(AddConferenceResponseModel.fromJson(response.body));
    } else {
      return const Left(
          'Failed to add conference data. Check your data again.');
    }
  }

  Future<Either<String, UpdateOrderStatusResponseModel>> cancelOrder(
      CancelOrderRequestModel requestModel, String transactionId) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders/$transactionId/cancel');

    // Send the request
    final response = await http.patch(
      url,
      headers: headers,
      body: requestModel.toJson(),
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Request: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(UpdateOrderStatusResponseModel.fromJson(response.body));
    } else {
      return const Left('Cancel order error.');
    }
  }
}
