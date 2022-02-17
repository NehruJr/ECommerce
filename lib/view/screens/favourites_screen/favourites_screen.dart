import 'package:e_shop/data/model/product_model.dart';
import 'package:e_shop/logic/controllers/product_controller.dart';
import 'package:e_shop/view/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Obx(
        () {
          if (controller.favouriteProducts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/heart.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please add Your Favourite products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemBuilder: (context, index) {
                ProductModel favourites = controller.favouriteProducts[index];
                return buildFavItems(
                    imageUrl: favourites.image,
                    productTitle: favourites.title,
                    productPrice: favourites.price,
                    productId: favourites.id, productModel: favourites);
              },
              itemCount: controller.favouriteProducts.length,
            );
          }
        },
      ),
    );
  }

  Widget buildFavItems({
    required ProductModel productModel,
    required String imageUrl,
    required String productTitle,
    required double productPrice,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: (){
          Get.offAll(() => ProductDetailsScreen(
            productModel: productModel,
          ));
        },
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              SizedBox(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productTitle,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$ $productPrice',
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  controller.manageFavourites(productId);
                },
                icon: const Icon(
                  Icons.highlight_remove_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
