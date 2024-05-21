part of 'check_in_attendance_bloc.dart';

@freezed
class CheckInAttendanceEvent with _$CheckInAttendanceEvent {
  const factory CheckInAttendanceEvent.started() = _Started;
  const factory CheckInAttendanceEvent.checkInAttendance(
      String latitude, String longitude) = _CheckInAttendance;
}
