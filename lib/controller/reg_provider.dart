// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class RegProvider extends ChangeNotifier {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController conformPasswordController =
//       TextEditingController();
//   bool passwordVisible = false;
//   signUp(context) async {
//     showDialog(
//       context: context,
//       builder: (context) => const Center(child: CircularProgressIndicator()),
//     );

//     if (passwordController.text != conformPasswordController.text) {
//       displayMessage('Passwords don\'t match', context);
//       notifyListeners();
//       return;
//     }

//     try {
//       if (context.mounted) Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       //pop loading circle
//       Navigator.pop(context);
//       //show error to user
//       displayMessage(e.code, context);
//       notifyListeners();
//     }
//     notifyListeners();
//   }

//   //display dialogue message to user
//   void displayMessage(String message, BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(message),
//       ),
//     );
//     notifyListeners();
//   }

//   void togglePasswordVisibility() {
//     passwordVisible = !passwordVisible;
//     notifyListeners();
//   }

//   void clear() {
//     nameController.clear();
//     emailController.clear();
//     passwordController.clear();
//     conformPasswordController.clear();
//   }

//   bool createObscureText = true;
//   void createObscureChange() {
//     createObscureText = !createObscureText;
//     notifyListeners();
//   }

//   bool conformObscureText = true;
//   void conformObscureChange() {
//     conformObscureText = !conformObscureText;
//     notifyListeners();
//   }
// }
