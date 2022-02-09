import 'package:e_shop/config/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key, required this.text, required this.onPressed, required this.buttonText}) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(text: text, color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
          TextButton(onPressed: onPressed, child: TextUtils(
              text: buttonText,
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,))
        ],
      ),
    );
  }
}
