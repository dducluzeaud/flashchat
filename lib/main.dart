import 'package:flutter/material.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlashChat());
}

class FlashChat extends StatefulWidget {
  @override
  _FlashChatState createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              initialRoute: WelcomeScreen.url,
              routes: {
                WelcomeScreen.url: (context) => WelcomeScreen(),
                LoginScreen.url: (context) => LoginScreen(),
                RegistrationScreen.url: (context) => RegistrationScreen(),
                ChatScreen.url: (context) => ChatScreen()
              },
            );
          }
          return Text("Initialize ...");

          // Otherwise, show something whilst waiting for initialization to complete
        });
  }
}
