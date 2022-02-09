import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/view/widgets/settings/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            splashColor: kMainColor.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () {
              Get.defaultDialog(
                title: 'Warning',
                middleText: 'Are You Sure you want to Logout',
                onCancel: () => Get.back(),
                onConfirm: () => authController.userSignOut(),
              );
            },
            child: customIcon(color: kLogOutSettings, title: 'Logout'.tr , icon: Icons.logout))
      ],
    );
  }
}
