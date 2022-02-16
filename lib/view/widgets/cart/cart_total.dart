import 'package:e_shop/config/routes.dart';
import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children:  [
              const TextUtils(
                  text: "Total",
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              Text(
                "\$ ${controller.totalPrice}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutesNames.paymentScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TextUtils(
                        text: "Check Out",
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart_rounded)
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: kMainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
