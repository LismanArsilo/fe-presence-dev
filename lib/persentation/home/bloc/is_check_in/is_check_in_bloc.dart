// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:presence_flutter_app/data/datasources/attendance_remote_datasource.dart';

part 'is_check_in_bloc.freezed.dart';
part 'is_check_in_event.dart';
part 'is_check_in_state.dart';

class IsCheckInBloc extends Bloc<IsCheckInEvent, IsCheckInState> {
  final AttendanceRemoteDataResource attendanceRemoteDataResource;
  IsCheckInBloc(
    this.attendanceRemoteDataResource,
  ) : super(const _Initial()) {
    on<_IsCheckIn>((event, emit) async {
      emit(const _Loading());
      try {
        final statusCheckIn = await attendanceRemoteDataResource.isCheckIn();
        statusCheckIn.fold(
          (l) => emit(_Error(l)),
          (r) => _Success(r),
        );
      } catch (e) {
        emit(
          _Error(e.toString()),
        );
      }
    });
  }
}
