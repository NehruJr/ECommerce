import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/view/widgets/payment/delivery_container.dart';
import 'package:e_shop/view/widgets/payment/payment_methods.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kMainColor,
        title: const Text("Payment Screen"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
            const TextUtils(
                text: 'Shipping to',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            const SizedBox(
              height: 20,
            ),
            const DeliveryDetails(),
            const SizedBox(
              height: 20,
            ),
            const TextUtils(
                text: 'Payment Method',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            const SizedBox(
              height: 20,
            ),
            const PaymentMethods(),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                text: 'TOTAL ${cartController.totalPrice}\$',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0.0,
                        primary: kMainColor),
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
