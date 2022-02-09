import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'category_items.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isCategoryLoading.value ?
      const Center(
        child: CircularProgressIndicator(color: kMainColor,),
      ):ListView.separated(
          padding:
              const EdgeInsets.symmetric(horizontal: 13).copyWith(right: 15),
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  String categoryName = controller.categoriesName[index];
                  controller.getCategoryProducts(categoryName);
                  Get.to(() => CategoryItems(categoryName: categoryName,));
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.orangeAccent,
                  image: DecorationImage(
                    image:NetworkImage(controller.categoriesImages[index],
                   ),
                    fit: BoxFit.cover,
                  )),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.categoriesName[index].toUpperCase(),
                        style: const TextStyle(
                            backgroundColor: Colors.black38,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: controller.categoriesName.length);
    });
  }
}
