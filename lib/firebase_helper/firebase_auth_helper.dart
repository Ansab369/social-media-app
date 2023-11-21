import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/constants/validations.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> getAuthChange() {
    return _auth.authStateChanges();
  }


// login with firebase
  Future<bool> login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showErrorMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Wrong password provided for that user.');
      }
      return false;
    }
  }

// create new account 
  Future<bool> register(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showErrorMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showErrorMessage('The account already exists for that email.');
      }
      return false;
    }
  }

// logOut
  void logout() {
    _auth.signOut();
    showSuccessMessage("SignOut Successfuly");
  }
}
