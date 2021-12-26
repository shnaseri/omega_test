import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/context_extensions.dart';

class ViewFileScreen extends StatefulWidget {
  final String urlImage;

  ViewFileScreen({required this.urlImage});

  @override
  State<StatefulWidget> createState() => ViewFileScreenState();
}

class ViewFileScreenState extends State<ViewFileScreen> {
  _showimage() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: CachedNetworkImage(
          color: Colors.white,
          imageUrl: widget.urlImage,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: context.width(),
              height: context.height() * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain, image: imageProvider)),
            );
          },
          placeholder: (context, url) {
            return new Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: new Center(child: _showimage()));
  }
}
