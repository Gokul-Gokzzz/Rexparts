// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:rexparts/model/user_model.dart';
// import 'package:rexparts/service/firestore_service.dart';

// class UserProvider extends ChangeNotifier {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   FirestoreService firestoreService = FirestoreService();
//   UserModel? userModel;
//   getCurrentUser() async {
//     userModel = await firestoreService.fetchUserData();
//     notifyListeners();
//   }

//   addUser(UserModel user) async {
//     await firestoreService.storeUserData(user);
//     notifyListeners();
//   }
// }
