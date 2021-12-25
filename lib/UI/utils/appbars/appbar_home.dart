import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/const_repository.dart';
import 'appbar.dart';

class AppBarHome extends AppBarWidget {
  final String title;

  const AppBarHome(BuildContext context, {Key? key, required this.title})
      : super(key: key, parentContext: context);

  @override
  List<Widget>? getActions() {
    // TODO: implement getActions
    return [
      Icon(
        Icons.menu,
        color: Colors.black.withOpacity(0.4),
      ).paddingLeft(10)
    ];
  }

  @override
  getLeading() {
    return Container(
      margin: EdgeInsets.only(left: 13),
      child: Icon(
        Icons.shopping_cart,
        color: Colors.black.withOpacity(0.4),
      ),
    );
  }

  @override
  Widget getTitleWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Text(title,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: boldTextStyle(
          size: 19,
          color: Colors.white
        ),
      ),
    );
  }
}
