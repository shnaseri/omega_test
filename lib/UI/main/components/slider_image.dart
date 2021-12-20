import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(

      /// Width of the [ImageSlideshow].
      width: double.infinity,

      /// Height of the [ImageSlideshow].
      height: 200,

      /// The page to show when first creating the [ImageSlideshow].
      initialPage: 0,

      /// The color to paint the indicator.
      indicatorColor: Color(0xff3CB371),

      /// The color to paint behind th indicator.
      indicatorBackgroundColor: Colors.white70,

      /// The widgets to display in the [ImageSlideshow].
      /// Add the sample image file into the images folder
      children: [
        Image.asset(
          'assets/images/1.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/2.jpg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/3.jpg',
          fit: BoxFit.cover,
        ),
      ],

      /// Called whenever the page in the center of the viewport changes.
      onPageChanged: (value) {
        print('Page changed: $value');
      },

      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 3000,
      /// Loops back to first slide.
      isLoop: true,
    );
  }
}
