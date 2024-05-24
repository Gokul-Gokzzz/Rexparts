import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/login_provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: loginProvider.emailControler,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: const Text('Email Address'),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Image.asset(
                            'assets/login1.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Consumer<LoginProvider>(
                      builder: (context, value, child) => TextFormField(
                        controller: loginProvider.passwordControler,
                        obscureText: !value.passwordVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Image.asset(
                              'assets/login2.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              value.togglePasswordVisibility();
                            },
                            icon: Icon(value.passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(
                        300,
                        50,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginProvider.signInWithEmailAndPassword(context);
                        loginProvider.clear();
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const Text('or connect with'),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            value.signInWithGoogle(context);
                          },
                          child: Container(
                            child: Image.asset(
                              'assets/google.png',
                              height: 35,
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/facebook.png',
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/login.png',
                        height: size.height * .30,
                        width: double.infinity,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -30,
                        child: Image.asset(
                          'assets/welcome2.png',
                          height: size.height * .31,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
