import 'package:e_shop/view/widgets/category/category_card.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15),
      child: Column(
        children:   [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              child: TextUtils(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                text: "Category",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: CategoryCard()),
        ],
      ),
    );
  }
}
