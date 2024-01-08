import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void initializeFirebase() {}

  Future signInAnonymous() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User? user = result.user;
      print(result);
      // print(
      //     "display name ---> ${user!.displayName}\n email----> ${user.email} \n phone number ---> ${user.phoneNumber}\n user UId ---->${user.uid} \n ${user.tenantId}");
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
}
