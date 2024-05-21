// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:presence_flutter_app/data/datasources/attendance_remote_datasource.dart';
import 'package:presence_flutter_app/data/models/request/check_in_out_request_model.dart';
import 'package:presence_flutter_app/data/models/response/company_response_model.dart';

part 'get_company_bloc.freezed.dart';
part 'get_company_event.dart';
part 'get_company_state.dart';

class GetCompanyBloc extends Bloc<GetCompanyEvent, GetCompanyState> {
  final AttendanceRemoteDataResource attendanceRemoteDataResource;
  GetCompanyBloc(
    this.attendanceRemoteDataResource,
  ) : super(const _Initial()) {
    on<_GetCompany>((event, emit) async {
      emit(const _Loading());
      try {
        final company = await attendanceRemoteDataResource.getCompanyProfile();
        company.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Success(r)),
        );
      } catch (e) {
        emit(
          _Error(e.toString()),
        );
      }
    });
  }
}
