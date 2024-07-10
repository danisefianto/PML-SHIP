import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/update_document_request_model.dart';
import '../models/response/get_all_documents_response_model.dart';
import '../models/response/update_document_response_model.dart';
import 'auth_local_datasource.dart';

class DocumentRemoteDatasource {
  Future<Either<String, GetAllDocumentsResponseModel>> getDocumentsData(
      String transactionId) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/documents/$transactionId');

    // Send the request
    final response = await http.get(
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
      return Right(GetAllDocumentsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get order data');
    }
  }

  Future<Either<String, UpdateDocumentResponseModel>> uploadDocument(
      UpdateDocumentRequestModel requestModel, String transactionId) async {
    // Get the token from the local storage
    final authData = await AuthLocalDataSource().getAuthData();

    // Headers
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.data!.token}',
    };

    // URL
    final url = Uri.parse('${Variables.baseUrl}/api/documents/$transactionId');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add the file to the request
    request.files.add(await http.MultipartFile.fromPath(
        'document_file', requestModel.documentFile.path));

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
    log('File path: ${requestModel.documentFile.path}');

    // Log the response body
    log('Response: $body');
    log('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Right(UpdateDocumentResponseModel.fromJson(body));
    } else {
      return const Left('Update data error.');
    }
  }
}
