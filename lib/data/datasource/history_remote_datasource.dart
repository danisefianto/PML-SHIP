import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/response/history_response_model.dart';
import 'auth_local_datasource.dart';

class HistoryRemoteDatasource {
  Future<Either<String, HistoryResponseModel>> getHistory() async {
    final url = Uri.parse('${Variables.baseUrl}/api/history');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");
    if (response.statusCode == 200) {
      return Right(HistoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get history data');
    }
  }
}
