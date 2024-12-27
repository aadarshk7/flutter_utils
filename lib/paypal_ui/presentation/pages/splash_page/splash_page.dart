import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash_page_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SplashPageBloc, SplashPageState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => const CircularProgressIndicator(),
              loading: (_) => const CircularProgressIndicator(),
              authenticated: (_) => const CircularProgressIndicator(),
              unauthenticated: (_) => const CircularProgressIndicator(),
              error: (_) => const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
