import 'package:e_shop/view/screens/category_screen/category_screen.dart';
import 'package:e_shop/view/screens/favourites_screen/favourites_screen.dart';
import 'package:e_shop/view/screens/home_screen/home_screen.dart';
import 'package:e_shop/view/screens/settings_screen/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ].obs;

  final titles = [
    "E SHOP",
    "Categories",
    "Favourites",
    "Settings"
  ].obs;
}
