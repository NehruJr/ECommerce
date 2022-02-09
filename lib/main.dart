import 'package:e_shop/config/routes.dart';
import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'config/consts_strings.dart';
import 'config/languages/localization.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E COMMERCE APP',
      locale: Locale(GetStorage().read<String>("lang").toString()),
      fallbackLocale: Locale(ene),
      translations: Localization(),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeData,
      initialRoute: AppRoute.initialRouteName,
      getPages: AppRoute.routes,
    );
  }
}
