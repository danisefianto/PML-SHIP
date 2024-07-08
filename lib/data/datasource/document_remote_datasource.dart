import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/update_document_request_model.dart';
import '../models/response/get_all_documents_response_model.dart';
import '../models/response/update_document_response_model.dart';
import 'auth_local_datasource.dart';

class DocumentRemoteDatasource {
  //   if (response.statusCode == 200) {
  //     return Right(UpdateDocumentResponseModel.fromJson(body));
  //   } else if (response.statusCode == 400) {
  //     return const Left('Dokumen sudah ada.');
  //   } else if (response.statusCode == 404) {
  //     return const Left('Transaksi tidak ditemukan.');
  //   } else {
  //     return const Left('Update document gagal. Cek kembali data Anda.');
  //   }
  Future<Either<String, GetAllDocumentsResponseModel>> getDocumentsData(
      String transactionId) async {
    final url = Uri.parse('${Variables.baseUrl}/api/documents/$transactionId');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Accept': 'application/json',
    });
    log("Request URL: $url");
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");

    if (response.statusCode == 200) {
      return Right(GetAllDocumentsResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get order data');
    }
  }

  Future<Either<String, UpdateDocumentResponseModel>> uploadDocument(
      UpdateDocumentRequestModel requestModel, String transactionId) async {
    final authData = await AuthLocalDataSource().getAuthData();

    var request = http.MultipartRequest(
        'POST', Uri.parse('${Variables.baseUrl}/api/documents/$transactionId'));

    var headers = {
      'Authorization': 'Bearer ${authData.data!.token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    request.headers.addAll(headers);

    request.fields.addAll(requestModel.toMap());
    request.files.add(await http.MultipartFile.fromPath(
        'document_file', requestModel.documentFile.path));

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    log("request: ${request.url}");
    log("request: ${request.fields}");
    log("request: ${request.files}");

    log("resposen: ${response.statusCode}");
    log("resposen: $body");

    if (response.statusCode == 200) {
      return Right(UpdateDocumentResponseModel.fromJson(body));
    } else {
      return const Left('Update data error.');
    }
  }
}
