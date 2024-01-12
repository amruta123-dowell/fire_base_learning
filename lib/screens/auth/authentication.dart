import 'package:firebase_learning/screens/auth/register_screen.dart';
import 'package:firebase_learning/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? SignInScreen(toggleSignInButton: toggleView)
        : RegisterScreen(
            toggleSignInButton: toggleView,
          ); // SignInScreen();
  }
}
