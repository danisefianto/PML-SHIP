import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/request/update_document_request_model.dart';
import '../models/response/update_document_response_model.dart';
import 'auth_local_datasource.dart';

class UpdateDocumentRemoteDatasource {
  Future<Either<String, UpdateDocumentResponseModel>> updateDocument(
      UpdateDocumentRequestModel updateDocumentRequestModel) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Variables.baseUrl}/api/updateDocument'));
    final authData = await AuthLocalDataSource().getAuthData();
    var headers = {
      'Authorization': 'Bearer ${authData.data.token}',
      'Accept': 'application/json',
    };
    request.fields.addAll(updateDocumentRequestModel.toMap());
    request.files.add(await http.MultipartFile.fromPath(
        'document', updateDocumentRequestModel.document.path));

    request.headers.addAll(headers);

    // Add header here if necessary

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    log("request: ${updateDocumentRequestModel.toMap()}");
    log("request: ${updateDocumentRequestModel.document.path}");
    log("resposen: ${response.statusCode}");
    log("resposen: $body");

    if (response.statusCode == 200) {
      return Right(UpdateDocumentResponseModel.fromJson(body));
    } else {
      return const Left('Update document gagal. Cek kembali data Anda.');
    }
  }
}
