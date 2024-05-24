import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'package:pml_ship/core/constants/variables.dart';
import 'package:pml_ship/data/datasource/auth_local_datasource.dart';
import 'package:pml_ship/data/models/response/currency_response_model.dart';

class CurrencyRemoteDataSource {
  Future<Either<String, CurrencyResponseModel>> fetchLatestRates() async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/api/currencies');
      final authData = await AuthLocalDataSource().getAuthData();
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
      });
      log("response: ${response.statusCode}");
      log("response: ${response.body}");

      if (response.statusCode == 200) {
        final currencyResponse = CurrencyResponseModel.fromJson(response.body);
        return Right(currencyResponse);
      } else {
        return const Left('Failed to fetch currency data.');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
