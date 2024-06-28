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
      'Authorization': 'Bearer ${authData.data.token}',
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

    var request = http.MultipartRequest(
        'POST', Uri.parse('${Variables.baseUrl}/api/user'));

    var headers = {
      'Authorization': 'Bearer ${authData.data.token}',
      'Accept': 'application/json',
    };
    request.fields
        .addAll(Map<String, String>.from(updateUserDataRequestModel.toMap()));
    // request.files.add(await http.MultipartFile.fromPath(
    //     'company_akta', updateUserDataRequestModel.companyAkta.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    log("request: ${updateUserDataRequestModel.toJson()}");
    log("resposen: ${response.statusCode}");
    log("resposen: $body");

    if (response.statusCode == 200) {
      return Right(UpdateUserDataResponseModel.fromJson(body));
    } else {
      return const Left('Update data error.');
    }
  }
}
