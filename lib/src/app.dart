import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/views/bottom_navigation.dart';
import 'screens/views/forgot_password.dart';
import 'screens/views/homepage.dart';
import 'screens/views/loadingscreen.dart';
import 'screens/views/login_page.dart';
import 'screens/views/login_success.dart';
import 'screens/views/profile.dart';
import 'screens/views/signup_page.dart';

class SmartFarmApp extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color(0xFF008000).withOpacity(.1),
    100: Color(0xFF008000).withOpacity(.2),
    200: Color(0xFF008000).withOpacity(.3),
    300: Color(0xFF008000).withOpacity(.4),
    400: Color(0xFF008000).withOpacity(.5),
    500: Color(0xFF008000).withOpacity(.6),
    600: Color(0xFF008000).withOpacity(.7),
    700: Color(0xFF008000).withOpacity(.8),
    800: Color(0xFF008000).withOpacity(.9),
    900: Color(0xFF008000).withOpacity(1),
  };

  final MaterialColor customColor = MaterialColor(0xFF008000, color);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Smart Farm',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: ThemeData(
          primarySwatch: customColor,
          primaryColor: Color(0xFF008000),
        ),
        routes: {
          '/': (context) => LoadingScreen(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/bottomNavigation': (context) => BottomNavigationScreen(),
          '/login_success': (context) => LoginSuccessScreen(),
          '/forgot_password': (context) => ForgotPasswordScreen(),
          '/profile': (contxet) => ProfileScreen(),
        },
      ),
    );
  }
}
