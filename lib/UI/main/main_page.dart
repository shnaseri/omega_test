
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/appbars/appbar_home.dart';

import 'components/slider_image.dart';

class MainPageSection extends StatefulWidget {
  const MainPageSection({Key? key}) : super(key: key);

  @override
  _MainPageSectionState createState() => _MainPageSectionState();
}

class _MainPageSectionState extends State<MainPageSection> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBarHome(context , title: 'درخواست آنلاین خدمات بهشت زهرا (س)',),
        body: ListView(
          children: [
          SliderImage(),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xff5F6A6B)
              ),
              child: Center(
                child: Text(
                  'به چه خدماتی نیاز دارید؟',
                  style: boldTextStyle(
                    color: Colors.white,
                    size: 20
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

