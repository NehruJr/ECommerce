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

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Column(
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
                          text: 'LOG IN',
                          fontSize: 35,
                          color: kMainColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AuthTextFormField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value) || value == null) {
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(RoutesNames.forgetPasswordScreen);
                            },
                            child: const TextUtils(
                              text: 'Forget Password?',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                     GetBuilder<AuthController>(builder: (controller) =>  AuthButton(
                       text: 'LOG IN',
                       onPressed: () {
                         if(formKey.currentState!.validate()){
                           controller.loginUsingEmailAndPassword(email: emailController.text.trim(), password: passwordController.text);
                         }
                       },
                     ),),
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                          child: TextUtils(
                              text: 'OR LOGIN WITH',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<AuthController>(builder: (controller) => InkWell(
                            onTap: (){
                              controller.googleSignIn();
                            },
                            child: Image.asset('assets/images/google.png'),
                          ),),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: Image.asset('assets/images/facebook.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomContainer(
                text: 'Don\'t have an Account?',
                onPressed: () {
                  Get.offNamed(RoutesNames.signupScreen);
                },
                buttonText: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
