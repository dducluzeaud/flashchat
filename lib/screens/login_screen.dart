import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/api/auth.dart';
import 'package:flashchat/components/button.dart';
import 'package:flashchat/components/input.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const url = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            Input(
              text: "Enter your email",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            Input(
              text: "Enter your password",
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            Button(
              title: 'Log in',
              color: Colors.lightBlueAccent,
              onPressed: () {
                login(email: email, password: password, context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
