// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:rexparts/model/user_model.dart';

// class FirestoreService {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   Future<void> storeUserData(UserModel user) async {
//     await firestore
//         .collection('users')
//         .doc(user.uid)
//         .set(user.toJson(), SetOptions(merge: true));
//   }

//   fetchUserData() async {
//     DocumentSnapshot doc = await firestore
//         .collection('users')
//         .doc(firebaseAuth.currentUser!.uid)
//         .get();
//     return UserModel.fromjson(doc.data());
//   }
// }
