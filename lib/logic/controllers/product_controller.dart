import 'package:e_shop/data/model/product_model.dart';
import 'package:e_shop/data/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productsList = <ProductModel>[].obs;
  RxList<ProductModel> favouriteProducts = <ProductModel>[].obs;
  RxBool isLoading = true.obs;
  GetStorage favouritesStorage = GetStorage();

  //search
  RxList searchedProducts = <ProductModel>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getProducts();
    List? favItems = favouritesStorage.read<List>('favProducts');
    if (favItems != null) {
      favouriteProducts = favItems
          .map((product) => ProductModel.fromJson(product))
          .toList()
          .obs;
    }
  }

  void getProducts() async {
    List<ProductModel> products = await ProductService.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavourites(int productId) async {
    var existingIndex =
        favouriteProducts.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favouriteProducts.removeAt(existingIndex);
      await favouritesStorage.remove('favProducts');
    } else {
      favouriteProducts
          .add(productsList.firstWhere((element) => element.id == productId));
      await favouritesStorage.write('favProducts', favouriteProducts);
    }
  }

  bool isFavourites(int productId) {
    return favouriteProducts.any((element) => element.id == productId);
  }

  //search bar
  void findSearchedProducts(String searchText) {
    searchText = searchText.toLowerCase();
    searchedProducts.value = productsList
        .where((product) =>
            product.title.toLowerCase().contains(searchText) ||
            product.price.toString().contains(searchText))
        .toList();
    update();
  }

  void clearSearchbar() {
    searchTextController.clear();
    findSearchedProducts('');
  }
}
