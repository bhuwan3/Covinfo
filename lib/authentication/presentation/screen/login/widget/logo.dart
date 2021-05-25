import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.double_arrow,
          color: Colors.blue.shade900,
          size: 60.0,
        ),
        Text(
          "Covinfo",
          style:
              TextStyle(fontFamily: "Fam", color: Colors.white, fontSize: 40.0),
        ),
        Icon(
          Icons.double_arrow,
          color: Colors.red,
          size: 60.0,
        ),
      ],
    );
  }
}
