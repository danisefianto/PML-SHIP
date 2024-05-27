import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/summary_order_request_model.dart';
import '../models/response/summary_order_response_model.dart';
import 'auth_local_datasource.dart';

class SummaryOrderRemoteDataSource {
  Future<Either<String, SummaryOrderResponseModel>> getSummaryOrder(
      SummaryOrderRequestModel summaryOrderRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/summaryOrder'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: summaryOrderRequestModel.toJson(),
    );
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");
    if (response.statusCode == 200) {
      return Right(SummaryOrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Summary order error');
    }
  }
}
