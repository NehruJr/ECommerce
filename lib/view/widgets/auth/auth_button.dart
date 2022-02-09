import 'package:e_shop/config/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
    style: ElevatedButton.styleFrom(
     primary: kMainColor,
     minimumSize: const Size(360,50),
    )
    , child: TextUtils(
      text: text,
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ));
  }
}
