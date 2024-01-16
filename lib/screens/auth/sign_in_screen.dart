import 'package:firebase_learning/custom_widgets/loading.dart';
import 'package:firebase_learning/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final Function toggleSignInButton;
  SignInScreen({required this.toggleSignInButton, super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text("Sign in"),
        ),
        body: loading
            ? const LoadingWidget()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Email*"),
                        TextFormField(
                          controller: emailController,
                          validator: (value) =>
                              value?.isEmpty == true ? "add valid email" : null,
                          onChanged: (value) => setState(() {
                            email = value;
                          }),
                        ),
                        const SizedBox(height: 20),
                        const Text("Password*"),
                        TextFormField(
                          controller: passController,
                          validator: (value) => value?.isEmpty == true
                              ? "add valid password, it's incorrect"
                              : null,
                          onChanged: (value) => setState(() {
                            pass = value;
                          }),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  var result = await _auth.signInAnonymous();
                                  if (result == null) {
                                    print("error Signing In");
                                  } else {
                                    print("Logged in successfully......");
                                  }
                                  loading = false;
                                },
                                child: const Text("Sign in anonymous")),
                            const SizedBox(width: 15),
                            ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState != null &&
                                      formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    final result =
                                        await _auth.signInWithUsernamePassword(
                                            email, pass);
                                    if (result == null) {
                                      setState(() {
                                        errorMessage = "error Sign in";
                                      });
                                    }
                                    loading = false;
                                  }
                                },
                                child: const Text("Sign In"))
                          ],
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                            onPressed: () {
                              widget.toggleSignInButton();
                            },
                            child: const Text("Create new account")),
                        const SizedBox(height: 10),
                        Text(
                          errorMessage,
                          style: const TextStyle(
                              color: Colors.red, height: 1, fontSize: 20),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
