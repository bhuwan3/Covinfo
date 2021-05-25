import 'package:covinfo/authentication/presentation/screen/login/widget/widget.dart';
import 'package:covinfo/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String id = "login_screen";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        new TextEditingController().clear();
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Logo(),
                SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                EntryField(
                  onChanged: (value) {},
                  title: "Enter email",
                  colour: Colors.blue.shade900,
                  obscure: false,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                EntryField(
                  onChanged: (value) {},
                  title: "Enter Password",
                  colour: Colors.blue.shade900,
                  obscure: true,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Button(
                  title: "Log In",
                  color: Colors.blue.shade900,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
