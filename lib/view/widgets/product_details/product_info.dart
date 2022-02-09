import 'package:e_shop/config/theme.dart';
import 'package:e_shop/logic/controllers/product_controller.dart';
import 'package:e_shop/view/widgets/product_details/size_list.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:readmore/readmore.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo(
      {Key? key,
      required this.productTitle,
      required this.productId,
      required this.productRating,
      required this.productDescription})
      : super(key: key);
  final String productTitle;
  final int productId;
  final double productRating;
  final String productDescription;
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
          .copyWith(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  productTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(productId);
                    },
                    child: controller.isFavourites(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 25,
                          )
                        : const Icon(Icons.favorite_outline, size: 25),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              TextUtils(
                  text: '$productRating',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              RatingBar.builder(
                itemSize: 20,
                initialRating: productRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  debugPrint('$rating');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            productDescription,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: "Show More",
            moreStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kMainColor,
            ),
            trimExpandedText: "Show Less.",
            lessStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kMainColor,
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizeList(),
        ],
      ),
    );
  }
}
