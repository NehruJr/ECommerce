import 'package:e_shop/config/consts_strings.dart';
import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/view/widgets/auth/auth_button.dart';
import 'package:e_shop/view/widgets/auth/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Forget Password' , style: TextStyle(color: kMainColor),),
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back ,color: Colors.black,),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Image.asset('assets/images/forgetpass copy.png'),
            AuthTextFormField(
              controller: emailController,
              obscureText: false,
              validator: (value) {
                if (RegExp(validationEmail).hasMatch(value)) {
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
              height: 50,
            ),
            GetBuilder<AuthController>(builder: (controller) => AuthButton(
              onPressed: (){
                if(formKey.currentState!.validate()) {
                  controller.resetPassword(email: emailController.text.removeAllWhitespace);
                }},
              text: 'Reset Password',
            ),),
          ],
        ),
      ),
    ));
  }
}
