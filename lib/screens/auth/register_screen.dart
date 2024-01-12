import 'package:firebase_learning/custom_widgets/loading.dart';
import 'package:firebase_learning/screens/home/home_screen.dart';
import 'package:firebase_learning/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleSignInButton;

  const RegisterScreen({super.key, required this.toggleSignInButton});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  String email = '';
  String pass = '';
  String errorMessage = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Sign up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
        child: loading
            ? const LoadingWidget()
            : Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email*"),
                    TextFormField(
                      controller: emailController,
                      onChanged: (value) => setState(() {
                        email = value;
                      }),
                      validator: (value) =>
                          value?.isEmpty == true ? "Enter correct email" : null,
                    ),
                    const SizedBox(height: 20),
                    const Text("Password*"),
                    TextFormField(
                      controller: passController,
                      onChanged: (value) => setState(() {
                        pass = value;
                      }),
                      validator: (value) => value == null ||
                              value.isEmpty == true ||
                              value.length < 6
                          ? "Enter correct password"
                          : null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState != null &&
                                    formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  var result = await _auth
                                      .registerWishEmailAndPass(email, pass);
                                  if (result != null) {
                                    print("Registered successfully");
                                  }
                                } else {
                                  errorMessage =
                                      "Email/Password is wrong. Please check";
                                }

                                loading = false;
                              },
                              child: const Text("Register")),
                          const SizedBox(width: 15),
                          ElevatedButton(
                              onPressed: () {
                                widget.toggleSignInButton();
                              },
                              child: const Text("Go to Sign in"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
