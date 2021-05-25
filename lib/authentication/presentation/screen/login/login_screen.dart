import 'package:covinfo/authentication/presentation/screen/login/widget/widget.dart';
import 'package:covinfo/constants.dart';
import 'package:covinfo/home/presentation/screen/allCountry/allCountry_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;

  String password;

  bool loadingSpinner = false;

  final _auth = FirebaseAuth.instance;

  storeEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        new TextEditingController().clear();
      },
      child: ModalProgressHUD(
        inAsyncCall: loadingSpinner,
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
                    onChanged: (value) {
                      email = value;
                    },
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
                    onChanged: (value) {
                      password = value;
                    },
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
                    onPressed: () async {
                      setState(() {
                        loadingSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          storeEmail();
                          Navigator.pushNamed(context, AllCountryScreen.id);
                        }
                        setState(() {
                          loadingSpinner = false;
                        });
                      } catch (e) {
                        setState(() {
                          loadingSpinner = false;
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
