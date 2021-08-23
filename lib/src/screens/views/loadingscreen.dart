import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import '../widgets/loading.dart';
import 'bottom_navigation.dart';
import 'login_page.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSplashScreen(
        duration: 3000,
        splash: Loading(),
        nextScreen: AuthenticationWrapper(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class AuthenticationWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);

    return _authState.map(
      data: (data) {
        print(data);
        if (data.value == null) return LoginPage();
        return BottomNavigationScreen();
      },
      loading: (_) => Loading(),
      error: (e) => Text('$e'),
    );
  }
}
