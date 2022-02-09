
import 'package:e_shop/logic/controllers/main_screen_controller.dart';
import 'package:e_shop/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
  }}