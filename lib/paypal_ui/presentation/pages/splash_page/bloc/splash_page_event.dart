part of 'splash_page_bloc.dart';

@freezed
class SplashPageEvent with _$SplashPageEvent {
  const factory SplashPageEvent.started() = _Started;
  const factory SplashPageEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory SplashPageEvent.navigateToLogin() = _NavigateToLogin;
  const factory SplashPageEvent.navigateToHome() = _NavigateToHome;
}
