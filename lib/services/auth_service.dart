import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void initializeFirebase() {}

  Future signInAnonymous() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User? user = result.user;
    } catch (e) {
      print(e.toString());
    }
  }
}
