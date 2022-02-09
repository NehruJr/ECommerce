import 'package:e_shop/logic/binding/auth_binding.dart';
import 'package:e_shop/logic/binding/main_binding.dart';
import 'package:e_shop/logic/binding/product_binding.dart';
import 'package:e_shop/view/screens/cart_screen/cart_screen.dart';
import 'package:e_shop/view/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

class AppRoute {
  static final initialRouteName = FirebaseAuth.instance.currentUser != null || GetStorage().read('userStatus') != null ? RoutesNames.mainScreen : RoutesNames.welcomeScreen;

  static final routes = [
    GetPage(
      name: RoutesNames.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesNames.signupScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesNames.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: RoutesNames.settingsScreen,
        page: () => SettingsScreen(),
        binding: AuthBinding(),),
    GetPage(
      name: RoutesNames.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: RoutesNames.cartScreen,
      page: () =>  CartScreen(),
    bindings: [
      AuthBinding(),
      ProductBinding(),
    ])
  ];
}

class RoutesNames {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const settingsScreen = '/settingsScreen';
  static const cartScreen = '/cartScreen';
}
