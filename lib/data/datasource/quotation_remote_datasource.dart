import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:pml_ship/core/constants/variables.dart';

import 'package:pml_ship/data/datasource/auth_local_datasource.dart';
import 'package:pml_ship/data/models/request/quotation_request_model.dart';

import 'package:pml_ship/data/models/response/quotation_response_model.dart';

class QuotationRemoteDataSource {
  Future<Either<String, QuotationResponseModel>> checkQuotation(
      QuotationRequestModel quotationRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/checkQuotation'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: quotationRequestModel.toJson(),
    );
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    // print("request: ${quotationRequestModel.toJson()}");
    // print("resposen: ${response.body}");
    if (response.statusCode == 200) {
      return Right(QuotationResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to check quotation');
    }
  }
}
