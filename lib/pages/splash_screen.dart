import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/main.dart';

import '../bloc/splash_screen_bloc/splash_screen_bloc.dart';
import '../bloc/splash_screen_bloc/splash_screen_state.dart';
import '../components/splash_screen_widget.dart';

// This the widget where the BLoC states and events are handled.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashScreenBloc(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          // Here I have used BlocBuilder, but instead you can also use BlocListner as well.
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            builder: (context, state) {
              if (state is Loaded) {
                return const MyHomePage();
              } else {
                return SplashScreenWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
