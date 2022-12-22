import 'package:chatbot_template/utils/constants.dart';
import 'package:chatbot_template/logic/controller/login_controller.dart';
import 'package:chatbot_template/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/my_string.dart';

class LoginScreen extends StatelessWidget {
  
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

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
                      'Login by',
                      style: TextStyle(color: kGreyColor),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            minHeight: 52,
                            minWidth: 133,
                          ),
                          width: 15.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png'),
                              const SizedBox(width: 8),
                              const Text(
                                'with Google',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          constraints: const BoxConstraints(
                            minHeight: 52,
                            minWidth: 133,
                          ),
                          width: 15.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/apple.png'),
                              const SizedBox(width: 8),
                              const Text(
                                'with Apple',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'or',
                      style: TextStyle(color: kGreyColor),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Form(
                        key: _formKey,
                        child: Container(
                          constraints: const BoxConstraints(

                            minWidth: 150 * 2,
                          ),
                          width: 40.w,
                         
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'User Name',
                                style: TextStyle(color: kGreyColor),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: _userController,
                                validator: (value) {
                                  bool _isEmailValid = RegExp(validationEmail).hasMatch(value!);
                                  if (!_isEmailValid) {
                                    return 'Invalid email.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter your name',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: true,
                                        onChanged: (value) {},
                                        activeColor: kGreyColor,
                                      ),
                                      const Text(
                                        'Remember me',
                                        style: TextStyle(
                                          color: kGreyColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
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
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      minHeight: 32,
                                      minWidth: 118,
                                    ),
                                    width: 15.w,
                                    height: 4.h,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        backgroundColor: kGreyColor2,
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          controller.signIn(
                                            _userController.text.trim(),
                                            _passwordController.text.trim(),
                                          );
                                        } else {
                                          return null;
                                        }
                                      },
                                      child: const Text('Login'),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have account?',
                                    style: TextStyle(color: kGreyColor),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.signUpScreen);
                                    },
                                    child: const Text(
                                      'Sign Up',
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
