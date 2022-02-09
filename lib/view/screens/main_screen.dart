import 'package:badges/badges.dart';
import 'package:e_shop/config/routes.dart';
import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/logic/controllers/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: Text(controller.titles[controller.currentIndex.value]),
            centerTitle: true,
            actions: [
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantityOfProductsInCart.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(RoutesNames.cartScreen);
                    },
                    icon: Image.asset('assets/images/shop.png'),
                  ),
                ),
              ),
            ],
            backgroundColor: kMainColor,
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              customBottomNavItem(
                itemLabel: 'Home',
                itemIcon: Icons.home,
              ),
              customBottomNavItem(
                itemLabel: 'Categories',
                itemIcon: Icons.category,
              ),
              customBottomNavItem(
                itemLabel: 'Favourites',
                itemIcon: Icons.favorite,
              ),
              customBottomNavItem(
                itemLabel: 'Settings',
                itemIcon: Icons.settings,
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
        ),
      ),
    );
  }

  customBottomNavItem({required String itemLabel, required IconData itemIcon}) {
    return BottomNavigationBarItem(
        activeIcon: Icon(
          itemIcon,
          color: kPinkClr,
        ),
        icon: Icon(
          itemIcon,
          color: Colors.black,
        ),
        label: itemLabel);
  }
}
