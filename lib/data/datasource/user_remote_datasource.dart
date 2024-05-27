import '../../core/constants/variables.dart';
import 'auth_local_datasource.dart';
import '../models/response/user_response_model.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

class UserRemoteDatasource {
  Future<Either<String, UserResponseModel>> getFullUserData() async {
    final url = Uri.parse('${Variables.baseUrl}/api/user');
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return Right(UserResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get user data');
    }
  }
}
