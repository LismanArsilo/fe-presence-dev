import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:presence_flutter_app/core/constants/variables.dart';
import 'package:presence_flutter_app/data/datasources/auth_local_datasource.dart';
import 'package:presence_flutter_app/data/models/request/check_in_out_request_model.dart';
import 'package:presence_flutter_app/data/models/response/check_in_out_response_model.dart';
import 'package:presence_flutter_app/data/models/response/company_response_model.dart';
import 'package:http/http.dart' as http;

class AttendanceRemoteDataResource {
  Future<Either<String, CompanyResponseModel>> getCompanyProfile() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/company');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}'
      },
    );

    if (response.statusCode == 200) {
      return Right(CompanyResponseModel.fromJson(response.body));
    } else {
      return const Left('Get Company Failed');
    }
  }

  Future<Either<String, bool>> isCheckIn() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/attendance/status/checkin');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}'
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return Right(responseData['is_checkin'] as bool);
    } else {
      return const Left('Get Status Checkin Failed');
    }
  }

  Future<Either<String, CheckInOutResponseModel>> checkIn(
      CheckInOutRequestModel data) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/attendance/checkin');
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authData?.token}'
        },
        body: data.toJson());

    if (response.statusCode == 200) {
      return Right(CheckInOutResponseModel.fromJson(response.body));
    } else {
      return const Left('Checkin Failed');
    }
  }

  Future<Either<String, CheckInOutResponseModel>> checkOut(
      CheckInOutRequestModel data) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/attendance/checkout');
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authData?.token}'
        },
        body: data.toJson());

    if (response.statusCode == 200) {
      return Right(CheckInOutResponseModel.fromJson(response.body));
    } else {
      return const Left('Checkin Failed');
    }
  }

  Future<Either<String, bool>> isCheckOut() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/attendance/status/checkout');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}'
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return Right(responseData['is_checkout'] as bool);
    } else {
      return const Left('Get Status Checkout Failed');
    }
  }
}
