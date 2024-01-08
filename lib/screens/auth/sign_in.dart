import 'package:firebase_learning/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _auth = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Sign in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Email*"),
            TextFormField(
              controller: TextEditingController(),
            ),
            const SizedBox(height: 20),
            const Text("Password*"),
            TextFormField(
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  var result = await _auth.signInAnonymous();
                  if (result == null) {
                    print("error Signing In");
                  } else {
                    print("Logged in successfully......");
                  }
                },
                child: const Text("Sign in anonymous")),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlines button"))
          ],
        ),
      ),
    );
  }
}
