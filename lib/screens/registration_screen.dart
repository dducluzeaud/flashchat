import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/components/button.dart';
import 'package:flashchat/components/input.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const url = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';

  void register() async {
    print(email);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushNamed(context, ChatScreen.url);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

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
            Hero(
              tag: "logo",
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
              secure: true,
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
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: register,
            )
          ],
        ),
      ),
    );
  }
}
