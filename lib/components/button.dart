import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: SizedBox(
          width: 200,
          child: MaterialButton(
              onPressed: onPressed,
              minWidth: 200.0,
              height: 42.0,
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
