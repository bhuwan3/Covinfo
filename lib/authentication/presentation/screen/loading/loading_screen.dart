import 'package:covinfo/authentication/presentation/screen/splash/splash_screen.dart';
import 'package:covinfo/constants.dart';
import 'package:covinfo/home/presentation/screen/allCountry/allCountry_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static String id = "loading_screen";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getMail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    if (email != null) {
      Navigator.pushNamed(context, AllCountryScreen.id);
    } else {
      Navigator.pushNamed(context, SplashScreen.id);
    }
  }

  @override
  void initState() {
    super.initState();
    getMail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SpinKitDualRing(
            color: Colors.red,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
