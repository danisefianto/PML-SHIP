import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/response/get_all_status_order_response_model.dart';
import 'auth_local_datasource.dart';

class HistoryRemoteDatasource {
  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllPendingOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_pending');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllPaymentPendingOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=payment_pending');

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );
// Log the request
    log("Request URL: $url");
    log("Request Headers: ${headers.toString()}");

    log("resposen: ${response.statusCode}");
    log("resposen pendingOrders: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all payment pending orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllOnShippingOrders() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/orders?status=on_shipping');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all on shipping orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllCompletedOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_completed');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all completed orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllCanceledOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_canceled');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all canceled orders');
    }
  }

  Future<Either<String, GetAllStatusOrderResponseModel>>
      getAllRejectedOrders() async {
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
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_rejected');

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
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(GetAllStatusOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected orders');
    }
  }
}
