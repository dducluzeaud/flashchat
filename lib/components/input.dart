import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({required this.text, required this.onChanged, this.secure = false});

  final bool secure;
  final String text;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: secure,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: text,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
