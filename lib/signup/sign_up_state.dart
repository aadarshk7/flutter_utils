part of 'sign_up_bloc.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = _Loading;
  const factory SignupState.success() = _Success;
  const factory SignupState.error() = _Error;
}
