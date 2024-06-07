import 'package:flutter/material.dart';
import 'package:rexparts/model/user_model.dart';
import 'package:rexparts/service/auth_service.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UserModel? currentUser;
  final AuthService authService = AuthService();

  getUser() async {
    currentUser = await authService.getCurrentUser();
    if (currentUser != null) {
      nameController.text = currentUser!.name ?? '';
      emailController.text = currentUser!.email ?? '';
      phoneController.text = currentUser!.phoneNumber ?? '';
    }
    notifyListeners();
  }

  addUser() async {
    final user = UserModel(
      email: emailController.text,
      phoneNumber: phoneController.text,
      name: nameController.text,
    );
    await authService.addUser(user);
    getUser();
  }

  updateUser() async {
    final user = UserModel(
      email: emailController.text,
      phoneNumber: phoneController.text,
      name: nameController.text,
    );
    await authService.updateUser(user);
    getUser();
  }
}
