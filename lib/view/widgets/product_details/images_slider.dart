import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shop/config/theme.dart';
import 'package:e_shop/view/widgets/product_details/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSlider extends StatefulWidget {
  const ImagesSlider({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  _ImagesSliderState createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  final List<Color> colorOptions = [
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: 3,
              carouselController: carouselController,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.fitHeight,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                );
              },
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 2,
                onPageChanged: (index, reason) => setState(() {
                  currentPage = index;
                }),
              )),
          Positioned(
              bottom: 30,
              left: MediaQuery.of(context).size.width / 2.2,
              child: AnimatedSmoothIndicator(
                activeIndex: currentPage,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: kMainColor,
                ),
              )),
          Positioned(
              bottom: 30,
              right: 30,
              child: Container(
                height: 200,
                width: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: ListView.separated(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ColorPicker(
                          outerBorder: currentColor == index,
                          color: colorOptions[index]),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 3,
                        ),
                    itemCount: colorOptions.length),
              )),
        ],
      ),
    );
  }
}
