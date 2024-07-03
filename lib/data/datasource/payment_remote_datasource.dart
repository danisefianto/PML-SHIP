import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pml_ship/data/models/response/payment_options_response_model.dart';

import '../../core/constants/variables.dart';
import '../models/request/add_payment_request_model.dart';
import '../models/request/update_payment_request_model.dart';
import '../models/response/add_payment_response_model.dart';
import '../models/response/update_payment_response_model.dart';
import 'auth_local_datasource.dart';

class PaymentRemoteDatasource {
  Future<Either<String, PaymentOptionsResponseModel>> getPaymentOptions(
      String transactionId) async {
    final url =
        Uri.parse('${Variables.baseUrl}/api/payment-options/$transactionId');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.data.token}',
      'Accept': 'application/json',
    });
    log("Request URL: $url");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(PaymentOptionsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get payment options data');
    }
  }

  Future<Either<String, AddPaymentResponseModel>> addPayment(
      AddPaymentRequestModel requestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/payments'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.data.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestModel.toJson(),
    );
    log("message: ${requestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");
    if (response.statusCode == 200) {
      return Right(AddPaymentResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to add payment data. Check your data again.');
    }
  }

  Future<Either<String, UpdatePaymentResponseModel>> uploadPaymentProof(
      UpdatePaymentRequestModel requestModel, String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();

    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${Variables.baseUrl}/api/upload-payment-proof/$transactionId'));

    var headers = {
      'Authorization': 'Bearer ${authData.data.token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    request.headers.addAll(headers);

    request.fields.addAll(requestModel.toMap());
    request.files.add(await http.MultipartFile.fromPath(
        'document_file', requestModel.documentFile.path));

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    log("request: ${request.url}");
    log("request: ${request.fields}");
    log("request: ${request.files}");

    log("resposen: ${response.statusCode}");
    log("resposen: $body");

    if (response.statusCode == 200) {
      return Right(UpdatePaymentResponseModel.fromJson(body));
    } else {
      return const Left('Update data error.');
    }
  }
}
