import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:omega_test/UI/utils/appbars/appbar_title_profile.dart';
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
        appBar: AppBarTitleProfile(
          context,
          0,
          title: widget.serviceData.name,
          functionBack: () {
            finish(context);
          },
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: widget.serviceData.serviceId,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
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
                        imageUrl: getUrlImageOfService(
                            widget.serviceData.serviceId.toString()),
                        fit: BoxFit.fill,
                        height: context.height() * 0.4,
                        width: context.width(),
                      )),
                ),
                16.height,
                Text(widget.serviceData.name,
                        style: boldTextStyle(color: Colors.black))
                    .paddingOnly(right: 18),
                16.height,
                if (widget.serviceData.description.contains('>'))
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Html(
                      data: widget.serviceData.description,
                    ),
                  )
                else
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      widget.serviceData.description,
                      style: primaryTextStyle(color: Colors.black),
                    ).paddingSymmetric(horizontal: 8),
                  ),
                15.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'هزینه خدمات : ',
                      style: boldTextStyle(),
                    ),
                    Text(
                      formatter.format(widget.serviceData.price),
                      style: boldTextStyle(
                          color: const Color(0xff3CB371).withGreen(170)),
                    ),
                    Text(
                      " (${widget.serviceData.unitMeasureName})",
                      style: boldTextStyle(
                          color: const Color(0xff3CB371).withGreen(140)),
                    ),
                  ],
                ).paddingRight(15),
                30.height,
                Center(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Color(0xff3CB371),
                    child: Container(
                      height: 50,
                      width: context.width() * 0.85,
                      decoration: BoxDecoration(),
                      child: Center(
                          child: Text(
                        'ثبت سفارش',
                        style: boldTextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
