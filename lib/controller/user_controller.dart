import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rexparts/model/user_model.dart';
import 'package:rexparts/service/auth_service.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController UsernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UserModel? currentUser;
  final AuthService authService = AuthService();

  // getUser() async {
  //   currentUser = await authService.getCurrentUser();
  //   if (currentUser != null) {
  //     nameController.text = currentUser!.name ?? '';
  //     emailController.text = currentUser!.email ?? '';
  //     phoneController.text = currentUser!.phoneNumber ?? '';
  //   }
  //   notifyListeners();
  // }

  addUser(email, name) async {
    final user = UserModel(
      email: email,
      name: name,
      userId: FirebaseAuth.instance.currentUser!.uid,
    );
    await authService.addUser(user);
    notifyListeners();
  }

  updateUser() async {
    final user = UserModel(
      email: emailController.text,
      name: UsernameController.text,
    );
    await authService.updateUser(user);
  }
}
