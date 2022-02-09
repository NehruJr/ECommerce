import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/view/widgets/settings/app_mode.dart';
import 'package:e_shop/view/widgets/settings/languages_switcher.dart';
import 'package:e_shop/view/widgets/settings/logout_button.dart';
import 'package:e_shop/view/widgets/settings/profile_header.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}


class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileHeader(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
           TextUtils(
              text: "GENERAL".tr,
              color: kMainColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 20,
          ),
          AppMode(),
          const SizedBox(
            height: 20,
          ),
          LanguagesSwitcher(),
          const SizedBox(
            height: 20,
          ),
          LogoutButton(),
        ],
      ),
    );
  }
}