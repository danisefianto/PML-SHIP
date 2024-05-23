import 'dart:developer';

import 'package:pml_ship/core/constants/variables.dart';
import 'package:pml_ship/data/datasource/auth_local_datasource.dart';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:pml_ship/data/models/request/register_request_model.dart';
import 'package:pml_ship/data/models/response/auth_response_model.dart';
import 'package:pml_ship/data/models/response/register_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    // final response = await http.post(
    //   Uri.parse('${Variables.baseUrl}/api/register'),
    // headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // },
    //   body: registerRequestModel.toJson(),
    // );
    // log("resposen: ${response.statusCode}");
    // log("resposen: ${response.body}");
    // if (response.statusCode == 201) {
    //   return Right(RegisterResponseModel.fromJson(response.body));
    // } else {
    //   return const Left('Registrasi gagal. Cek kembali data Anda.');
    // }

    var request = http.MultipartRequest(
        'POST', Uri.parse('${Variables.baseUrl}/api/register'));
    request.fields.addAll(registerRequestModel.toMap());
    request.files.add(await http.MultipartFile.fromPath(
        'company_akta_url', registerRequestModel.companyAktaUrl.path));

    // Add header here if necessary

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    log("resposen: ${response.statusCode}");
    log("resposen: $body");

    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(body));
    } else {
      return const Left('Registrasi gagal. Cek kembali data Anda.');
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
      return const Left('Login failed. Check again your email and password.');
    }
  }

  Future<Either<String, bool>> logout() async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final url = Uri.parse('${Variables.baseUrl}/api/logout');
      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer ${authData.token}',
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
