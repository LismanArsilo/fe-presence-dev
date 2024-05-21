part of 'is_check_in_bloc.dart';

@freezed
class IsCheckInState with _$IsCheckInState {
  const factory IsCheckInState.initial() = _Initial;
  const factory IsCheckInState.loading() = _Loading;
  const factory IsCheckInState.success(bool data) = _Success;
  const factory IsCheckInState.error(String message) = _Error;
}
