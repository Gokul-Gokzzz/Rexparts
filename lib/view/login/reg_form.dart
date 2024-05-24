import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/reg_provider.dart';
import 'package:rexparts/controller/user_controller.dart';
import 'package:rexparts/model/user_model.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final regProvider = Provider.of<RegProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Name';
                            }
                            return null;
                          },
                          controller: regProvider.nameController,
                          decoration: const InputDecoration(
                              label: Text('Enter Full Name')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email';
                            }
                            return null;
                          },
                          controller: regProvider.emailController,
                          decoration: const InputDecoration(
                              label: Text('Enter Email Address')),
                        ),
                      ),
                      Consumer<RegProvider>(
                        builder: (context, value, child) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: !value.passwordVisible,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Password';
                                  }
                                  return null;
                                },
                                controller: regProvider.passwordController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      value.togglePasswordVisibility();
                                    },
                                    icon: Icon(value.passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  label: Text(
                                    'Enter Password',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Conform Password';
                                  }
                                  return null;
                                },
                                controller:
                                    regProvider.conformPasswordController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      value.togglePasswordVisibility();
                                    },
                                    icon: Icon(value.passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  label: Text('Conform Password'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: const Size(
                              300,
                              50,
                            ),
                          ),
                          onPressed: () async {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BottomNavBar()));
                            if (formKey.currentState!.validate()) {
                              await regProvider.signUp(context);
                              UserModel user = UserModel(
                                  uid: FirebaseAuth.instance.currentUser!.uid,
                                  email:
                                      regProvider.emailController.text.trim(),
                                  name: regProvider.nameController.text.trim());
                              Provider.of<UserProvider>(context, listen: false)
                                  .addUser(user);
                              // value.clear();
                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/welcome1.png',
                            height: size.height * .23,
                            width: double.infinity,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: -100,
                            child: Image.asset(
                              'assets/welcome2.png',
                              height: size.height * .31,
                              width: double.infinity,
                            ),
                          )
                        ],
                      )
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
