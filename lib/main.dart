import 'package:covinfo/authentication/presentation/screen/login/login_screen.dart';
import 'package:covinfo/authentication/presentation/screen/signup/signUp_screen.dart';
import 'package:covinfo/authentication/presentation/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Leela"),
      initialRoute: SignUpScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
      },
    );
  }
}
