import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

void login(
    {required String email,
    required String password,
    required BuildContext context}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    Navigator.pushNamed(context, ChatScreen.url);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
