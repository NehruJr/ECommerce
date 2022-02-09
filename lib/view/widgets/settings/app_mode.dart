import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/settings_controller.dart';
import 'package:e_shop/logic/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_icon.dart';

class AppMode extends StatelessWidget {
  AppMode({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customIcon(
            icon: Icons.dark_mode,
            color: kDarkSettings,
            title: "Dark Mode".tr,
          ),
          Switch(
            activeTrackColor: Get.isDarkMode ? kPinkClr : kMainColor,
            activeColor: Get.isDarkMode ? kPinkClr : kMainColor,
            value: controller.darkModeSwitch.value,
            onChanged: (value) {
              ThemeController().changeTheme();
              controller.darkModeSwitch.value = value;
            },
          ),
        ],
      ),
    );
  }
}
