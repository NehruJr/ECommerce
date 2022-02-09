import 'package:badges/badges.dart';
import 'package:e_shop/config/routes.dart';
import 'package:e_shop/data/model/product_model.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/view/widgets/product_details/add_to_cart.dart';
import 'package:e_shop/view/widgets/product_details/images_slider.dart';
import 'package:e_shop/view/widgets/product_details/product_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Obx(
            () => Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              animationDuration: const Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                cartController.quantityOfProductsInCart.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(RoutesNames.cartScreen);
                },
                icon: Image.asset(
                  'assets/images/shop.png',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesSlider(
              imageUrl: productModel.image,
            ),
            ProductInfo(
              productTitle: productModel.title,
              productId: productModel.id,
              productRating: productModel.rating.rate,
              productDescription: productModel.description,
            ),
            AddProductToCart(productModel: productModel),
          ],
        ),
      ),
    );
  }
}
