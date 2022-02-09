import 'package:e_shop/data/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsInCart = {}.obs;

  void addProductToCart(ProductModel productModel) {
    if (productsInCart.containsKey(productModel)) {
      productsInCart[productModel] += 1;
    } else {
      productsInCart[productModel] = 1;
    }
  }


  void reduceProductFromCart(ProductModel productModel) {
    if (productsInCart.containsKey(productModel) &&
        productsInCart[productModel] == 1) {
      productsInCart.removeWhere((key, value) => key == productModel);
    } else {
      productsInCart[productModel] -= 1;
    }
  }

  void removeOneProductFromCart(ProductModel productModel) {
    productsInCart.removeWhere((key, value) => key == productModel);
  }

  void clearAllProductsInCart() {
    productsInCart.isNotEmpty
        ? Get.defaultDialog(
            title: 'Warning',
            middleText: 'You are about to clear all products from your cart',
            onCancel: () => Get.back(),
            onConfirm: () {
              productsInCart.clear();
              Get.back();
            })
        : null;
  }

  get productSubTotal => productsInCart.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get totalPrice => productsInCart.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  get quantityOfProductsInCart => productsInCart.isNotEmpty
      ? productsInCart.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element)
      : 0;
}
