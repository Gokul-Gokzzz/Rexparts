// import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Map<String, dynamic>? _userData;

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   final LoginResult loginResult =
  //       await FacebookAuth.instance.login(permissions: ['email ']);
  //   if (loginResult == LoginStatus.success) {
  //     final userData = await FacebookAuth.instance.getUserData();
  //     _userData = userData;
  //   } else {
  //     print(loginResult.message);
  //   }

  //   final AuthCredential authCredential= FacebookAuthProvider.credential(loginResult.accessToken!.token);
  // return FirebaseAuth.instance.signInWithCredential(authCredential);
  // }
}
