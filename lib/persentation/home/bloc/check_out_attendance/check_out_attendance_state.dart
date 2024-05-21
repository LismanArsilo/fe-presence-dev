part of 'check_out_attendance_bloc.dart';

@freezed
class CheckOutAttendanceState with _$CheckOutAttendanceState {
  const factory CheckOutAttendanceState.initial() = _Initial;
  const factory CheckOutAttendanceState.loading() = _Loading;
  const factory CheckOutAttendanceState.loaded(
      CheckInOutResponseModel responseModel) = _Loaded;
  const factory CheckOutAttendanceState.error(String message) = _Error;
}
