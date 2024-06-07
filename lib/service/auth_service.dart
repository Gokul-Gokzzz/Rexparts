import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rexparts/model/user_model.dart';
import 'package:rexparts/view/bottom_bar/bottom_bar.dart';
import 'package:rexparts/widget/popup_widget.dart';

class AuthService {
  String? verificationid;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String collection = 'User';
  Reference storage = FirebaseStorage.instance.ref();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<UserModel> user;

  AuthService() {
    user = FirebaseFirestore.instance
        .collection(collection)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(
          snapshot.data()!,
        );
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  Future<void> addUser(UserModel data) async {
    try {
      await user.doc(firebaseAuth.currentUser!.uid).set(data);
    } catch (e) {
      log('Error adding user: $e');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      if (firebaseAuth.currentUser == null) {
        throw Exception('No current user found');
      }
      final snapshot = await firestore
          .collection(collection)
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      if (snapshot.exists && snapshot.data() != null) {
        return UserModel.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      log('Error getting current user: $e');
      rethrow;
    }
  }

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Account created');
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('User logged in');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOutEmail() async {
    await firebaseAuth.signOut();
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        log('Google authentication failed');
        throw Exception('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? guser = userCredential.user;
      log("User display Name: ${guser?.displayName}");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      return guser;
    } catch (e) {
      log('Google Sign-In Error: $e');
      rethrow;
    }
  }

  Future<void> signOutWithGoogle() async {
    await GoogleSignIn().signOut();
  }

  Future<void> getOtp(String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            await user.updatePhoneNumber(phoneAuthCredential);
          }
        },
        verificationFailed: (error) {
          log("verification failed error : $error");
        },
        codeSent: (verificationId, forceResendingToken) {
          verificationid = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verificationid = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      log("sign in error : $e");
    }
  }

  Future<PhoneAuthCredential?> verifyOtp(String otp, context) async {
    try {
      if (verificationid == null) {
        throw Exception('Verification ID is null');
      }
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationid!, smsCode: otp);
      await firebaseAuth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
        (route) => false,
      );
      PopupWidgets().showSuccessSnackbar(context, "OTP Validated");
    } catch (e) {
      PopupWidgets().showErrorSnackbar(context, "Invalid OTP");
      log("verify otp error $e");
      return null;
    }
    return null;
  }

  void passwordReset({required email, context}) async {
    try {
      log('start');
      await firebaseAuth.sendPasswordResetEmail(email: email);
      log('success');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      log('error occure');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  Future<void> updateUser(UserModel data) async {
    try {
      if (firebaseAuth.currentUser != null) {
        await user.doc(firebaseAuth.currentUser!.uid).update(data.toJson());
      } else {
        throw Exception('No current user found');
      }
    } catch (e) {
      log('Error updating user: $e');
    }
  }
}
