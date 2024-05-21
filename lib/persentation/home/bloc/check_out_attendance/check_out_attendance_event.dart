part of 'check_out_attendance_bloc.dart';

@freezed
class CheckOutAttendanceEvent with _$CheckOutAttendanceEvent {
  const factory CheckOutAttendanceEvent.started() = _Started;
  const factory CheckOutAttendanceEvent.checkOutAttendance(
      String latitude, String longitude) = _CheckOutAttendance;
}
