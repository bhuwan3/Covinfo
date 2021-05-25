import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button({this.onPressed, this.color, this.title});
  final Function onPressed;
  final Color color;
  final String title;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Material(
        elevation: 5.0,
        color: widget.color,
        borderRadius: BorderRadius.circular(16.0),
        child: MaterialButton(
          onPressed: widget.onPressed,
          minWidth: 400.0,
          height: 42.0,
          child: Text(
            widget.title,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
