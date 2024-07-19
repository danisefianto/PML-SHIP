import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/response/currency_response_model.dart';
import 'auth_local_datasource.dart';

class CurrencyRemoteDataSource {
  Future<Either<String, CurrencyResponseModel>> fetchLatestRates() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/currencies');

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
      final currencyResponse = CurrencyResponseModel.fromJson(response.body);
      return Right(currencyResponse);
    } else {
      return const Left('Failed to fetch currency data.');
    }
  }
}
