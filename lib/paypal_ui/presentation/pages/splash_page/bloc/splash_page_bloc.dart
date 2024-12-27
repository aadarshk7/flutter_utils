import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_page_bloc.freezed.dart';
part 'splash_page_event.dart';
part 'splash_page_state.dart';

class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  SplashPageBloc() : super(const _Initial()) {
    on<SplashPageEvent>((event, emit) {});
  }
}
