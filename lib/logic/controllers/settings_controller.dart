import 'dart:ui';

import 'package:e_shop/config/consts_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  RxBool darkModeSwitch = false.obs;
  var langStorage = GetStorage();
  var langLocale = ene;
  //Language

  @override
  void onInit() async {
    super.onInit();
    langLocale = await getLanguage;
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocale == typeLang) {
      return;
    } else if (typeLang == fre) {
      langLocale = fre;
      saveLanguage(fre);
    } else if (typeLang == ara) {
      langLocale = ara;
      saveLanguage(ara);
    }else{
      langLocale = ene;
      saveLanguage(ene);
    }
    update();
  }

  void saveLanguage(String lang) async {
    await langStorage.write("lang", lang);
  }

  Future<String> get getLanguage async {
    return await langStorage.read("lang");
  }
}
