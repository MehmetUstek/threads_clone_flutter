import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:threads_clone/bloc/splash_screen_bloc/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(Initial()) {
    on<SplashScreenEvent>(mapEventToState);
  }
  @override
  void mapEventToState(
      SplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    if (event is NavigateToHomeScreenEvent) {
      emit(Loading());

      // During the Loading state we can do additional checks like,
      // if the internet connection is available or not etc..

      await Future.delayed(Duration(
          seconds: 2)); // This is to simulate that above checking process
      emit(Loaded()); // In this state we can load the HOME PAGE
    }
  }
}
