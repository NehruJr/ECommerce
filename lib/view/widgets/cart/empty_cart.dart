import 'package:e_shop/config/theme.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 150,
            color: Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
              text: const TextSpan(children: [
            TextSpan(
              text: 'Your cart is ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Empty',
              style: TextStyle(
                color: kMainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
