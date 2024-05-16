import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:pml_ship/core/constants/variables.dart';

import 'package:pml_ship/data/datasource/auth_local_datasource.dart';
import 'package:pml_ship/data/models/response/port_response_model.dart';

class PortRemoteDataSource {
  Future<Either<String, PortResponseModel>> getPorts() async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/ports'),
        headers: {
          'Authorization': 'Bearer ${authData.token}',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return Right(PortResponseModel.fromJson(response.body));
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return const Left('Error');
    }
  }
}
