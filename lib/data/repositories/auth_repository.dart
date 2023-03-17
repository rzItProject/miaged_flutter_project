import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app_project_miaged/utils/constants.dart';
import 'package:flutter_app_project_miaged/utils/utils.dart';

class AuthRepository {
  AuthRepository(this._auth);

  final FirebaseAuth _auth;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get onAuthStateChanges => _auth.authStateChanges();

  // Sign in with email and password
  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const message =
            'Aucun compte utilisateur ne correspond à l\'adresse renseignée !';
        Utils.showSnackBar(context, message);
      } else if (e.code == 'wrong-password') {
        const message =
            'Veuillez vérifier que vous avez entré les bonnes informations de connexion et réessayer';
        Utils.showSnackBar(context, message);
      } else {
        const message =
            'Désolé une erreur est survenu, veuillez reessayer plus tard.';
        Utils.showSnackBar(context, message);
      }
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
    Navigation.appNavigation.currentState!
        .pushNamedAndRemoveUntil(treePage, (Route<dynamic> route) => false);
  }

  Future<void> register({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.showSnackBar(
            context, 'weak-password: Please enter strong password');
      } else if (e.code == 'invalid-email') {
        Utils.showSnackBar(
            context, 'invalid-email: Please enter a valid email ');
      } else if (e.code == 'email-already-in-use') {
        Utils.showSnackBar(context,
            'email-already-in-use: This already exist, please chose another email');
      } else {
        Utils.showSnackBar(
            context, 'An erreur occured. Please try again later');
      }
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
    // navigatorKey.currentState!.pushReplacementNamed(treePage);
    Navigation.appNavigation.currentState!
        .pushNamedAndRemoveUntil(treePage, (Route<dynamic> route) => false);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
