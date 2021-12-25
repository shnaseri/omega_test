
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:omega_test/UI/utils/appbars/appbar_home.dart';
import 'package:omega_test/UI/utils/appbars/appbar_title_profile.dart';
import 'package:omega_test/UI/utils/appbars/appbar_withback.dart';
import 'package:omega_test/model/service_data.dart';

import '../../logical/general_functions.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.serviceData});
  final ServiceData serviceData;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarTitleProfile(context, 0, title: widget.serviceData.name, functionBack: (){
          finish(context);
        },),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: widget.serviceData.serviceId,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill, image: imageProvider)),
                      );
                    },
                    placeholder: (context, strImage) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      );
                    },
                    imageUrl: getUrlImageOfService(widget.serviceData.serviceId.toString()),
                    fit: BoxFit.fill,
                    height: context.height() * 0.4,
                    width: context.width(),
                  )
                ),
              ),
              16.height,
              Text(widget.serviceData.name, style: boldTextStyle(color: Colors.white)).paddingOnly(left: 16),
              16.height,
              Text(
                widget.serviceData.description,
                style: primaryTextStyle(
                  color: Colors.white
                ),
              ).paddingAll(8)
            ],
          ),
        ),
      ),
    );
  }
}