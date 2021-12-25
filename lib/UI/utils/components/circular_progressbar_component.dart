import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
        spinnerDuration: 1500,
        size: 50,
        customColors: CustomSliderColors(
            dynamicGradient: true,
            progressBarColors: [
              const Color(0xff990033),
              const Color(0xff990033)
            ],
            trackColors: [Color(0xffD13438), Color(0xffCA5010)],
            dotColor: Color(0xffEA005E)),
        spinnerMode: true,
      )),
    );
  }
}
