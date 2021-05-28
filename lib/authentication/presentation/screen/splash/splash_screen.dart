import 'package:covinfo/authentication/presentation/screen/login/login_screen.dart';
import 'package:covinfo/authentication/presentation/screen/signUp/signUp_screen.dart';
import 'package:covinfo/authentication/presentation/screen/splash/widget/widget.dart';
import 'package:covinfo/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String id = "splash_screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(
                height: 50.0,
              ),
              Button(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                color: Colors.blue.shade900,
                title: "Log In",
              ),
              Button(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
                color: Colors.red,
                title: "Sign Up",
              )
            ],
          ),
        ),
      ),
    );
  }
}
