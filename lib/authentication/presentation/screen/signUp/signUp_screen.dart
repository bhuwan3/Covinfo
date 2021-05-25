import 'package:covinfo/authentication/presentation/screen/signUp/widget/widget.dart';
import 'package:covinfo/constants.dart';
import 'package:covinfo/home/presentation/screen/allCountry/allCountry_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "signUp_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email;

  String password;

  final _auth = FirebaseAuth.instance;

  bool loadingSpinner = false;

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
                    colour: Colors.red,
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
                    colour: Colors.red,
                    obscure: true,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Button(
                    title: "Sign Up",
                    color: Colors.red,
                    onPressed: () async {
                      setState(() {
                        loadingSpinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          storeEmail();
                          Navigator.pushNamed(context, AllCountryScreen.id);
                        }
                        setState(() {
                          loadingSpinner = false;
                        });
                      } catch (e) {
                        print(e);
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
