part of 'splash_page_bloc.dart';

@freezed
class SplashPageState with _$SplashPageState {
  const factory SplashPageState.initial() = _Initial;
  const factory SplashPageState.loading() = _Loading;
  const factory SplashPageState.authenticated() = _Authenticated;
  const factory SplashPageState.unauthenticated() = _Unauthenticated;
  const factory SplashPageState.error(String message) = _Error;
}
