import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/user_controller.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<UserProvider>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<UserProvider>(
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Account Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  child: Lottie.asset('assets/profile.json'),
                ),
                const SizedBox(height: 50),
                Row(
                  children: const [
                    Text(
                      'Username',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value.UsernameController.text.isEmpty
                          ? 'N/A'
                          : value.UsernameController.text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Show edit dialog and update name
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    Text(
                      'Email',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value.emailController.text.isEmpty
                          ? 'N/A'
                          : value.emailController.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Show edit dialog and update email
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    Text(
                      'Phone Number',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value.phoneController.text.isEmpty
                          ? 'N/A'
                          : value.phoneController.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Show edit dialog and update phone number
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
