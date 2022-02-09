import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
  Row(
          children: [
             const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1446938029495623681/pMkQpG9Y_400x400.jpg'),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: authController.auth.currentUser!.displayName ?? authController.googleSign.currentUser!.displayName! ,
                    color: Get.isDarkMode ? Colors.white : Colors.black ,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: authController.auth.currentUser!.email ?? authController.googleSign.currentUser!.email ,
                    color: Get.isDarkMode ? Colors.black : Colors.black ,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
