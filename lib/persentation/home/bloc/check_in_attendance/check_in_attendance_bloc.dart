import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presence_flutter_app/data/datasources/attendance_remote_datasource.dart';
import 'package:presence_flutter_app/data/models/request/check_in_out_request_model.dart';
import 'package:presence_flutter_app/data/models/response/check_in_out_response_model.dart';

part 'check_in_attendance_event.dart';
part 'check_in_attendance_state.dart';
part 'check_in_attendance_bloc.freezed.dart';

class CheckInAttendanceBloc
    extends Bloc<CheckInAttendanceEvent, CheckInAttendanceState> {
  final AttendanceRemoteDataResource attendanceRemoteDataResource;
  CheckInAttendanceBloc(this.attendanceRemoteDataResource)
      : super(const _Initial()) {
    on<_CheckInAttendance>((event, emit) async {
      emit(const _Loading());
      try {
        final requestModel = CheckInOutRequestModel(
          latitude: event.latitude,
          longitude: event.longitude,
        );
        final checkInAttendance =
            await attendanceRemoteDataResource.checkIn(requestModel);
        checkInAttendance.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Loaded(r)),
        );
      } catch (e) {
        emit(
          _Error(e.toString()),
        );
      }
    });
  }
}
