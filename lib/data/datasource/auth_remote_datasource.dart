import 'dart:developer';

import 'package:pml_ship/core/constants/variables.dart';
import 'package:pml_ship/data/datasource/auth_local_datasource.dart';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:pml_ship/data/models/request/register_request_model.dart';
import 'package:pml_ship/data/models/response/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('register gagal');
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to login');
    }
  }

  Future<Either<String, bool>> logout() async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final url = Uri.parse('${Variables.baseUrl}/api/logout');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${authData.accessToken}',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Left('Failed to logout');
      }
    } catch (e) {
      log("Failed: $e");
      return const Left('Failed to logout');
    }
  }
}
