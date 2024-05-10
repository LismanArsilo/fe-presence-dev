import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:presence_flutter_app/core/constants/variables.dart';
import 'package:presence_flutter_app/data/datasources/auth_local_datasource.dart';
import 'package:presence_flutter_app/data/models/response/auth_response_model.dart';

class ErrorResponse {
  final bool? status;
  final String? message;

  ErrorResponse({this.status, this.message});

  factory ErrorResponse.fromJson(String str) =>
      ErrorResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorResponse.fromMap(Map<String, dynamic> json) => ErrorResponse(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };
}

class AuthRemoteDataResource {
  Future<Either<dynamic, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/login');
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'email': email, 'password': password}));

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 422) {
      return const Left('Please Check Field Required');
    } else {
      return const Left('Invalid Credentials');
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/logout');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.data?.token}'
      },
    );

    if (response.statusCode == 200) {
      return const Right('Logout Successfully');
    } else {
      return const Left('Logout Failed');
    }
  }
}
