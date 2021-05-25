import 'package:covinfo/authentication/presentation/screen/loading/loading_screen.dart';
import 'package:covinfo/authentication/presentation/screen/login/login_screen.dart';
import 'package:covinfo/authentication/presentation/screen/signup/signUp_screen.dart';
import 'package:covinfo/authentication/presentation/screen/splash/splash_screen.dart';
import 'package:covinfo/home/presentation/screen/allCountry/allCountry_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Leela"),
      initialRoute: LoadingScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
        AllCountryScreen.id: (context) => AllCountryScreen(),
      },
    );
  }
}
