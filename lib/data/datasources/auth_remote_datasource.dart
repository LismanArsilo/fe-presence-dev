import 'dart:convert';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:presence_flutter_app/core/constants/variables.dart';
import 'package:presence_flutter_app/data/datasources/auth_local_datasource.dart';
import 'package:presence_flutter_app/data/models/response/auth_response_model.dart';
import 'package:presence_flutter_app/data/models/response/user_response_model.dart';

class ErrorResponseModel {
  final bool? status;
  final String? message;

  ErrorResponseModel({this.status, this.message});

  factory ErrorResponseModel.fromJson(String str) =>
      ErrorResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorResponseModel.fromMap(Map<String, dynamic> json) =>
      ErrorResponseModel(
        status: json['status'],
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };
}

class AuthRemoteDataResource {
  Future<Either<ErrorResponseModel, AuthResponseModel>> login(
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
    } else {
      return Left(ErrorResponseModel.fromJson(response.body));
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
        'Authorization': 'Bearer ${authData?.token}'
      },
    );

    if (response.statusCode == 200) {
      return const Right('Logout Successfully');
    } else {
      return const Left('Logout Failed');
    }
  }

  Future<Either<String, UserResponseModel>> updateProfileRegisterFace(
      String embedding, XFile? image) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/user/update-profile');
    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer ${authData?.token}'
      ..fields['face_embedding'] = embedding;
    // ..files.add(await http.MultipartFile.fromPath('image', image.path));
    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return Right(UserResponseModel.fromJson(responseString));
    } else {
      log(responseString);
      return const Left('Failed to update profile');
    }
  }
}
