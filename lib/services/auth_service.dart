import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

//To create model to store the userId as "UserModel"
  UserModel? _getUserDetailsFromFirebase(User? user) {
    print("user details success callback---> $user");
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Future signInAnonymous() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      // FirebaseUser -> User
      User? user = result.user;

      return _getUserDetailsFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  ///auth change user stream
  Stream<User?> get user {
    return auth.authStateChanges();
  }

  ///Sign out
  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  //Create account using user name and password
  Future registerWishEmailAndPass(String email, String pass) async {
    try {
      //AUthResult -> UserCredential
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User? user = result.user;
      return _getUserDetailsFromFirebase(user);
    } catch (e) {
      print("the sign up error is ----> ${e.toString()}");
      return null;
    }
  }

  ///Sign in using username and password
  Future signInWithUsernamePassword(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _getUserDetailsFromFirebase(user);
    } catch (e) {
      print("the error is ${e.toString()}");
      return null;
    }
  }
}
