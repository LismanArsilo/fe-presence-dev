part of 'check_in_attendance_bloc.dart';

@freezed
class CheckInAttendanceState with _$CheckInAttendanceState {
  const factory CheckInAttendanceState.initial() = _Initial;
  const factory CheckInAttendanceState.loading() = _Loading;
  const factory CheckInAttendanceState.loaded(
      CheckInOutResponseModel responseModel) = _Loaded;
  const factory CheckInAttendanceState.error(String message) = _Error;
}
