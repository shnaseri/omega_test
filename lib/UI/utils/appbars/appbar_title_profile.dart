import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/string_repository.dart';
import 'appbar.dart';

class AppBarTitleProfile extends AppBarWidget {
  final String title;
  final BuildContext context;
  final int index;
  final Function functionBack;

  const AppBarTitleProfile(this.context, this.index,
      {Key? key, required this.title, required this.functionBack})
      : super(key: key, parentContext: context);

  @override
  Widget getTitleWidget() {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: Theme.of(context).textTheme.headline6!.fontSize! * 0.8),
    );
  }

  @override
  getActions() {
    // TODO: implement getActions
    return [
      const Center(
        child: Text(
          backText,
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ).paddingRight(7),
      GestureDetector(
        onTap: () {
          Navigator.pop(parentContext);
          // functionBack();
        },
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.1),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ).paddingRight(10),
      ),
    ];
  }

  @override
  getLeading() {
    return Container(
      child: Icon(
        Icons.shopping_cart,
        color: Colors.black.withOpacity(0.4),
      ),
    );
  }
}
