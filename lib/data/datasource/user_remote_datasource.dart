import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/update_user_data_request_model.dart';
import '../models/response/update_user_data_response_model.dart';
import '../models/response/user_response_model.dart';
import 'auth_local_datasource.dart';

class UserRemoteDatasource {
  Future<Either<String, UserResponseModel>> getFullUserData() async {
    final url = Uri.parse('${Variables.baseUrl}/api/user');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(UserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get user data');
    }
  }

  Future<Either<String, UpdateUserDataResponseModel>> updateUserData(
      UpdateUserDataRequestModel updateUserDataRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.patch(
      Uri.parse('${Variables.baseUrl}/api/user'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: updateUserDataRequestModel.toJson(),
    );
    log("request: ${updateUserDataRequestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(UpdateUserDataResponseModel.fromJson(response.body));
    } else {
      return const Left('Update data error.');
    }
  }
}
