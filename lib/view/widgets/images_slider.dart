import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:slash/view/widgets/image_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesSlider extends StatefulWidget {
  final List<String> images;
  final double height;
  const ImagesSlider({required this.images, required this.height, super.key});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              return buildImage(widget.images[index], index);
            },
            options: CarouselOptions(
              height: widget.height,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) => setState(() {
                _currentIndex = index;
              }),
            )),
        const SizedBox(height: 10),
        AnimatedSmoothIndicator(
          effect: ExpandingDotsEffect(
            dotHeight: 7,
            dotWidth: 7,
            dotColor: Colors.grey,
            activeDotColor: Theme.of(context).primaryColorLight,
          ),
          curve: Curves.easeInCirc,
          activeIndex: _currentIndex,
          count: widget.images.length,
        )
      ],
    );
  }
}

Widget buildImage(String image, int index) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: ImageWidget(
      imagePath: image,
    ),
  );
}
