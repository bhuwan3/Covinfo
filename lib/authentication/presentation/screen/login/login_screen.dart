import 'package:covinfo/authentication/presentation/screen/login/widget/entry.dart';
import 'package:covinfo/authentication/presentation/screen/login/widget/logo.dart';
import 'package:covinfo/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String id = "login_screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            EntryField(
              title: "Enter email",
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
