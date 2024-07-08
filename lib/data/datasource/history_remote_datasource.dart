import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/response/history_response_model.dart';
import 'auth_local_datasource.dart';

class HistoryRemoteDatasource {
  Future<Either<String, HistoryResponseModel>> getAllPendingOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_pending');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Accept': 'application/json',
    };
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
      return Right(HistoryResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all pending orders');
    }
  }

  Future<Either<String, HistoryResponseModel>>
      getAllPaymentPendingOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=payment_pending');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Accept': 'application/json',
    };
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
      return Right(HistoryResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all payment pending orders');
    }
  }

  Future<Either<String, HistoryResponseModel>> getAllOnShippingOrders() async {
    final url = Uri.parse('${Variables.baseUrl}/api/orders?status=on_shipping');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Accept': 'application/json',
    };
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
      return Right(HistoryResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all on shipping orders');
    }
  }

  Future<Either<String, HistoryResponseModel>> getAllCompletedOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_completed');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Accept': 'application/json',
    };
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
      return Right(HistoryResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all completed orders');
    }
  }

  Future<Either<String, HistoryResponseModel>> getAllCanceledOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_canceled');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Accept': 'application/json',
    };
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
      return Right(HistoryResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all canceled orders');
    }
  }

  Future<Either<String, HistoryResponseModel>> getAllRejectedOrders() async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/orders?status=order_rejected');
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Accept': 'application/json',
    };
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
      return Right(HistoryResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get all rejected orders');
    }
  }
}
