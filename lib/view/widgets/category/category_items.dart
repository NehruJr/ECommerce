import 'package:e_shop/config/theme.dart';
import 'package:e_shop/data/model/product_model.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/logic/controllers/category_controller.dart';
import 'package:e_shop/logic/controllers/product_controller.dart';
import 'package:e_shop/view/screens/product_details/product_details_screen.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;
  final productController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: kMainColor,
        centerTitle: true,
      ),
      body: Obx(() {
        return categoryController.categoryProductsIsLoading.value ?
        const Center(
          child: CircularProgressIndicator(color: kMainColor,),
        ):
        GridView.builder(
          itemCount: categoryController.categoryProducts.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.8,
            mainAxisSpacing: 9.0,
            crossAxisSpacing: 6.0,
            maxCrossAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            var product = categoryController.categoryProducts[index];
            return buildItemsCard(
              productModel: product,
              imageUrl: product.image,
              itemPrice: product.price,
              itemRating: product.rating.rate,
              itemId: product.id,
            );
          },
        );
      }),
    );
  }

  Widget buildItemsCard({
    required ProductModel productModel,
    required String imageUrl,
    required double itemPrice,
    required double itemRating,
    required int itemId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          Get.to(() => ProductDetailsScreen(
                productModel: productModel,
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        productController.manageFavourites(itemId);
                      },
                      icon: productController.isFavourites(itemId)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_outline),
                      color: productController.isFavourites(itemId)
                          ? Colors.red
                          : Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModel);
                      },
                      icon: const Icon(Icons.add_shopping_cart_outlined),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $itemPrice',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextUtils(
                              text: '$itemRating',
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
