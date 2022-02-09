import 'package:e_shop/data/services/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList categoriesName = <String>[].obs;
  RxBool isCategoryLoading = false.obs;

  RxList categoryProducts = [].obs;
  RxBool categoryProductsIsLoading = false.obs;

  List<String> categoriesImages = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];
  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categoryName = await CategoryService.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoriesName.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  void getCategoryProducts(String categoryName) async{
   try{
    categoryProductsIsLoading(true);
    categoryProducts.value =  await CategoryService.getProductsByCategory(categoryName);
   }finally{
     categoryProductsIsLoading(false);
   }
   }
}
