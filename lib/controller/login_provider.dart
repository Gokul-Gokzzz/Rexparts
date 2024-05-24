import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rexparts/model/user_model.dart';
import 'package:rexparts/service/auth_service.dart';
import 'package:rexparts/view/bottom_bar/bottom_bar.dart';

// Import your bottom bar screen

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final AuthenticationService authenticationService = AuthenticationService();
  bool passwordVisible = false;

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  void signInWithEmailAndPassword(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await authenticationService.signInWithEmailAndPassword(
          emailControler.text, passwordControler.text);

      if (context.mounted) Navigator.pop(context);

      // Navigate to the bottom bar screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BottomNavBar()), // Replace with your bottom bar screen
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code, context);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await authenticationService.signInWithGoogle();
      notifyListeners();

      // Navigate to the bottom bar screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    } catch (e) {
      log(e.toString());
      displayMessage(e.toString(), context);
    }
  }

  void displayMessage(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  void clear() {
    emailControler.clear();
    passwordControler.clear();
  }
}
