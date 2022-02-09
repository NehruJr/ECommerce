import 'package:e_shop/config/theme.dart';
import 'package:e_shop/data/model/product_model.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AddProductToCart extends StatelessWidget {
  AddProductToCart({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;

  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                  text: "Price",
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              Text(
                  '\$'+productModel.price.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.5
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(onPressed: (){
                cartController.addProductToCart(productModel);
              },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    elevation: 0,
                    primary: kMainColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Add To Cart" , style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),),
                  SizedBox(width: 10,),
                  Icon(Icons.shopping_cart_outlined),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
