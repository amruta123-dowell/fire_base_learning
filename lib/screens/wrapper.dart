import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learning/controller.dart';
import 'package:firebase_learning/models/user_model.dart';
import 'package:firebase_learning/screens/auth/authentication.dart';
import 'package:firebase_learning/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Wrapper extends GetView<HomeController> {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return user == null ? const AuthenticateScreen() : const HomeScreen();
  }
}
