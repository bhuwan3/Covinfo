import 'package:flutter/material.dart';

class EntryField extends StatefulWidget {
  EntryField({this.title, this.onChanged});
  final String title;
  final Function onChanged;
  @override
  _EntryFieldState createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 28.0, top: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        height: 60.0,
        child: Row(
          children: [
            Container(
              width: 250.0,
              child: TextField(
                onChanged: widget.onChanged,
                keyboardType: TextInputType.emailAddress,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: widget.title,
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11.67, horizontal: 10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
