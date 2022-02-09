import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/view/widgets/cart/cart_product_card.dart';
import 'package:e_shop/view/widgets/cart/cart_total.dart';
import 'package:e_shop/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Text("Cart Items"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                controller.clearAllProductsInCart();
              },
              icon: const Icon(
                Icons.delete_sweep_rounded,
                color: Colors.red,
                size: 25,
              ))
        ],
      ),
      body: Obx(
        () => controller.productsInCart.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: ListView.separated(
                          padding: const EdgeInsets.only(top: 25),
                          itemBuilder: (context, index) => CartProductCard(
                                index: index,
                                productModel: controller.productsInCart.keys
                                    .toList()[index],
                                productQuantity: controller
                                    .productsInCart.values
                                    .toList()[index],
                              ),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                          itemCount: controller.productsInCart.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              )
            : const EmptyCart(),
      ),
    ));
  }
}
