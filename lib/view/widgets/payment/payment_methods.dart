import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/logic/controllers/payment_controller.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int radioPaymentIndex = 1;
  final paymentController = Get.find<PaymentController>();
  final cartController = Get.find<CartController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
              paymentMethodName: 'Paypal',
              imagePath: 'assets/images/paypal.png',
              scale: 0.7,
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          GetBuilder<PaymentController>(
            builder: (_) {
              return buildRadioPayment(
                  paymentMethodName: 'Google pay',
                  imagePath: 'assets/images/google.png',
                  scale: 0.8,
                  value: 2,
                  onChange: (int? value) {
                    setState(() {
                      radioPaymentIndex = value!;
                    });
                    paymentController.makeGooglePay(amount: cartController.totalPrice.toString(), label: authController.userDisplayName.value);
                  });
            },
          ),
          buildRadioPayment(
              paymentMethodName: 'Credit Card',
              imagePath: 'assets/images/credit.png',
              scale: 0.7,
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),

        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String imagePath,
    required double scale,
    required String paymentMethodName,
    required int value,
    required Function onChange,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 15),
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                  text: paymentMethodName,
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)
            ],
          ),
          Radio(
              value: value,
              fillColor: MaterialStateColor.resolveWith((states) => kMainColor),
              groupValue: radioPaymentIndex,
              onChanged: (int? value) {
                onChange(value);
              })
        ],
      ),
    );
  }
}
