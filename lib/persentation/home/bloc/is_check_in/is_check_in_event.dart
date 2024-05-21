part of 'is_check_in_bloc.dart';

@freezed
class IsCheckInEvent with _$IsCheckInEvent {
  const factory IsCheckInEvent.started() = _Started;
  const factory IsCheckInEvent.isCheckIn() = _IsCheckIn;
}
