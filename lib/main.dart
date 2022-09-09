import 'package:flutter/material.dart';
import 'package:my_app/screens/welcome_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/registration_screen.dart';
import 'package:my_app/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: 'welcome_Screen',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'welcome_Screen': (context) => WelcomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'chat_screen': (context) => ChatScreen(),
      },
    );
  }
}
