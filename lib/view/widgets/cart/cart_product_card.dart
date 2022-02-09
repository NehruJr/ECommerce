import 'package:e_shop/config/theme.dart';
import 'package:e_shop/data/model/product_model.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard({Key? key, required this.productModel, required this.index, required this.productQuantity}) : super(key: key);
  final ProductModel productModel;
  final int index;
  final int productQuantity;
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: kMainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 115,
            width: 120,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  productModel.image,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$ ${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.reduceProductFromCart(productModel);
                        }, icon: const Icon(Icons.remove_circle)),
                    Text('$productQuantity'),
                    IconButton(onPressed: () {
                      controller.addProductToCart(productModel);
                    }, icon: const Icon(Icons.add_circle)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                controller.removeOneProductFromCart(productModel);
              },
              icon: const Icon(Icons.delete),
              iconSize: 30,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
