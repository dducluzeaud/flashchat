import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/components/button.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const url = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0,
                ),
              ),
              AnimatedTextKit(animatedTexts: [
                TypewriterAnimatedText(
                  'Flash Chat',
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: Duration(milliseconds: 200),
                ),
              ])
            ]),
            SizedBox(
              height: 48.0,
            ),
            Button(
                title: "Login",
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.url);
                }),
            Button(
                title: "Register",
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.url);
                }),
          ],
        ),
      ),
    );
  }
}
