import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pml_ship/data/models/request/add_shipper_consignee_request_model.dart';
import 'package:pml_ship/data/models/response/add_shipper_consignee_response_model.dart';

import 'package:http/http.dart' as http;
import 'package:pml_ship/core/constants/variables.dart';
import 'package:pml_ship/data/datasource/auth_local_datasource.dart';

class AddShipperConsigneeRemoteDataSource {
  Future<Either<String, AddShipperConsigneeResponseModel>> addShipperConsignee(
      AddShipperConsigneeRequestModel addShipperConsigneeRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.patch(
      Uri.parse('${Variables.baseUrl}/api/addShipperConsignee'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: addShipperConsigneeRequestModel.toJson(),
    );
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");
    if (response.statusCode == 201) {
      return Right(AddShipperConsigneeResponseModel.fromJson(response.body));
    } else {
      return Left('Order error ${response.body}');
    }
  }
}
