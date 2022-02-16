import 'package:e_shop/config/theme.dart';
import 'package:e_shop/view/widgets/payment/delivery_container.dart';
import 'package:e_shop/view/widgets/payment/payment_methods.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children:   const [
            TextUtils(
                text: 'Shipping to',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 20,
            ),
            DeliveryDetails(),
            SizedBox(
              height: 20,
            ),
            TextUtils(
                text: 'Payment Method',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 20,
            ),
            PaymentMethods(),
          ],
        ),
      ),
    );
  }
}
