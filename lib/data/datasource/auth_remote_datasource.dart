import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/register_request_model.dart';
import '../models/request/update_user_data_request_model.dart';
import '../models/response/auth_response_model.dart';
import '../models/response/register_response_model.dart';
import '../models/response/update_user_data_response_model.dart';
import '../models/response/user_response_model.dart';
import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel requestModel) async {
    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/customer/register');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add the file to the request
    request.files.add(await http.MultipartFile.fromPath(
        'company_akta', requestModel.companyAkta.path));

    // Add the fields to the request
    request.fields.addAll(requestModel.toMap());

    // Add headers to the request
    request.headers.addAll(headers);

    // Send the request
    http.StreamedResponse response = await request.send();

    // Get the response body
    final String body = await response.stream.bytesToString();

    // Log the request
    log('Request: ${request.fields}');
    log('URL: $url');

    // Log file path
    log('File path: ${requestModel.companyAkta.path}');

    // Log the response body
    log('Response: $body');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(body));
    } else {
      return Left(RegisterResponseModel.fromJson(body).message);
    }
  }

  Future<Either<String, AuthResponseModel>> login(
    String email,
    String password,
  ) async {
    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/login');

    // Send the request
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    // // Log the request
    // log('Request: ${jsonEncode({
    //       'email': email,
    //       'password': password,
    //     })}');
    // log('URL: $url');

    // // Log the response body
    // log('Response: ${response.body}');
    // log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Left(AuthResponseModel.fromJson(response.body).message!);
    } else if (response.statusCode == 500) {
      return const Left('Server error. Please try again later.');
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, bool>> logout() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/logout');

    // Send the request
    final response = await http.delete(
      url,
      headers: headers,
    );

    // Log the request
    log('Request: $headers');
    log('URL: $url');

    // Log the response body
    log('Response: ${response.body}');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return const Right(true);
    } else {
      return Left(jsonDecode(response.body)['message']);
    }
  }

  Future<Either<String, UserResponseModel>> getAuthenticatedUserDetail() async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/user');

    // Send the request
    final response = await http.get(
      url,
      headers: headers,
    );

    // // Log the request
    // log('Request: $headers');
    // log('URL: $url');

    // // Log the response body
    // log('Request: ${response.body}');
    // log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(UserResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, UpdateUserDataResponseModel>> updateUserData(
      UpdateUserDataRequestModel data) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/user');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add the file to the request
    if (data.companyAkta != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'company_akta', data.companyAkta!.path));
    }
    // Convert your data to a map and add additional fields
    Map<String, String> updatedFields = data.toMap();
    updatedFields["_method"] = "PUT"; // Add your additional field

    // Add the updated fields to the request
    request.fields.addAll(updatedFields);
    // Add the fields to the request
    request.fields.addAll(data.toMap());

    // Add headers to the request
    request.headers.addAll(headers);

    // Send the request
    http.StreamedResponse response = await request.send();

    // Get the response body
    final String body = await response.stream.bytesToString();

    // Log the request
    log('Request: ${request.fields}');
    log('URL: $url');

    // Log file path
    if (data.companyAkta != null) {
      log('File path: ${data.companyAkta!.path}');
    }

    // Log the response body
    log('Response: $body');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(UpdateUserDataResponseModel.fromJson(body));
    } else {
      return const Left('Update data error.');
    }
  }
}
