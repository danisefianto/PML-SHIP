import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pml_ship/data/models/request/order_port_request_model.dart';
import 'package:pml_ship/data/models/response/order_port_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:pml_ship/core/constants/variables.dart';
import 'package:pml_ship/data/datasource/auth_local_datasource.dart';

class OrderPortRemoteDataSource {
  Future<Either<String, OrderPortResponseModel>> orderPort(
      OrderPortRequestModel orderPortRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/orderPort'),
      headers: <String, String>{
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: orderPortRequestModel.toJson(),
    );
    log("resposen: ${response.statusCode}");
    log("resposen: ${response.body}");
    if (response.statusCode == 201) {
      return Right(OrderPortResponseModel.fromJson(response.body));
    } else {
      return Left('Order error');
    }
  }
}
