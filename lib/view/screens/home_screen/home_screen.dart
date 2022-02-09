import 'package:e_shop/config/theme.dart';
import 'package:e_shop/view/widgets/home/card_items.dart';
import 'package:e_shop/view/widgets/home/search_bar.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextUtils(
                        text: 'Find',
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextUtils(
                        text: 'All You Want',
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchBar(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  text: 'Categories',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ItemsCard(),
          ],
        ),
      ),
    );
  }
}
