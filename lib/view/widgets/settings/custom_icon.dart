import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../text_utils.dart';

Widget customIcon({required color, required title , required icon}) {
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child:  Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        TextUtils(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          text: title,
          color: Get.isDarkMode ? Colors.white : Colors.black ,
        ),
      ],
    ),
  );
}
