import 'package:e_shop/config/consts_strings.dart';
import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/settings_controller.dart';
import 'package:e_shop/view/widgets/settings/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class LanguagesSwitcher extends StatelessWidget {
   LanguagesSwitcher({Key? key}) : super(key: key);
 final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
  builder: (_) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customIcon(icon: Icons.language, color: kLanguageSettings, title: 'Language'.tr),
        Container(
          width: 130,
          padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: Colors.black
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25,
              icon: const Icon(Icons.arrow_drop_down),
              items:  [
                DropdownMenuItem(child: Text(english , style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                value: ene,),
                DropdownMenuItem(child: Text(arabic , style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
                value: ara,),
                DropdownMenuItem(child: Text(french , style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
                value: fre,),
              ],
              value: controller.langLocale,
              onChanged: (value){
                controller.changeLanguage(value!);
                Get.updateLocale(Locale(value));
              },
            ),
          ),
        ),
      ],
    );
  },
);
  }
}
