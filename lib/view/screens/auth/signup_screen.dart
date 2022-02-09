import 'package:e_shop/config/consts_strings.dart';
import 'package:e_shop/config/routes.dart';
import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/view/widgets/auth/auth_button.dart';
import 'package:e_shop/view/widgets/auth/auth_text_field.dart';
import 'package:e_shop/view/widgets/auth/bottom_container.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 35.0,
                      ),
                      child: TextUtils(
                        text: 'SIGN UP',
                        fontSize: 35,
                        color: kMainColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    AuthTextFormField(
                      controller: usernameController,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationName).hasMatch(value) ||
                            value.toString().length <= 2) {
                          return "Enter valid name";
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Image.asset('assets/images/user.png'),
                      suffixIcon: const Text(''),
                      hintText: 'User Name',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    AuthTextFormField(
                      controller: emailController,
                      obscureText: false,
                      validator: (value) {
                        value = emailController.text.trim();
                        if (!RegExp(validationEmail).hasMatch(value) ||
                            value == null) {
                          return "Enter valid Email";
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Image.asset('assets/images/email.png'),
                      suffixIcon: const Text(''),
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    GetBuilder<AuthController>(
                      builder: (controller) => AuthTextFormField(
                        controller: passwordController,
                        obscureText:
                            controller.isPasswordVisible ? true : false,
                        validator: (value) {
                          if (value.toString().length < 8) {
                            return "Password must be at least 8";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Image.asset('assets/images/lock.png'),
                        suffixIcon: controller.isPasswordVisible
                            ? IconButton(
                                onPressed: () {
                                  controller.passwordVisibilty();
                                },
                                icon: const Icon(Icons.visibility),
                              )
                            : IconButton(
                                onPressed: () {
                                  controller.passwordVisibilty();
                                },
                                icon: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<AuthController>(
                      builder: (controller) => AuthButton(
                        text: 'SIGN UP',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.signupUsingEmailAndPassword(
                                userName: usernameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomContainer(
              text: 'Already have an account?',
              onPressed: () {
                Get.offNamed(RoutesNames.loginScreen);
              },
              buttonText: 'Login')
        ],
      ),
    );
  }
}
