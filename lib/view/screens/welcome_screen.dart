import 'package:e_shop/config/routes.dart';
import 'package:e_shop/config/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: TextUtils(
                        text: "Welcome",
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                            text: 'E',
                            color: kMainColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          width: 10,
                        ),
                        TextUtils(
                            text: 'Commerce',
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                  const SizedBox(height: 350,),
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed(RoutesNames.loginScreen);
                    },
                    child: const TextUtils(
                      text: 'Login',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: kMainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtils(text: 'If You Don\'t have an account? ', color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
                      InkWell(
                        onTap: (){
                          Get.offNamed(RoutesNames.signupScreen);
                        },
                        child: const TextUtils(text: 'SIGN UP', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold ),
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
