import 'package:chatbot_template/uitls/constants.dart';
import 'package:chatbot_template/logic/controller/login_controller.dart';
import 'package:chatbot_template/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../uitls/my_string.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 130),
                    const Text(
                      'Sign up',
                      style: TextStyle(color: kGreyColor2, fontSize: 27),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(color: kGreyColor),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                bool _isEmailValid = RegExp(validationEmail).hasMatch(value!);
                                if (!_isEmailValid) {
                                  return 'Invalid email.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                prefixIcon:
                                    Image.asset('assets/images/user.png'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: kGreyColor,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: kGreyColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Password',
                              style: TextStyle(color: kGreyColor),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters.';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                prefixIcon:
                                    Image.asset('assets/images/lock.png'),
                                suffixIcon: const Icon(
                                  Icons.visibility_off,
                                  color: kGreyColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: kGreyColor,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: kGreyColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: kGreyColor,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(
                                    color: kGreyColor,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  'Don\'t remember the password ?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: kGreyColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.width / 8.5,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kGreyColor2),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.signUpUsingFirebase(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text,
                                      );
                                    } else {
                                      return null;
                                    }
                                  },
                                  child: const Text('Sign Up'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have account ?',
                                  style: TextStyle(color: kGreyColor),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.loginScreen);
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: kGreyColor2,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
