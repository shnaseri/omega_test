import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:omega_test/UI/utils/components/circular_progressbar_component.dart';
import 'package:omega_test/UI/utils/view_image.dart';

import '../../logical/general_functions.dart';
import '../../model/image.dart';
import '../../model/service_data.dart';
import '../../state_management/album/album_cubit.dart';
import '../utils/appbars/appbar_title_profile.dart';

class AlbumPhotoPage extends StatefulWidget {
  const AlbumPhotoPage({Key? key, required this.serviceData}) : super(key: key);
  final ServiceData serviceData;

  @override
  _AlbumPhotoPageState createState() => _AlbumPhotoPageState();
}

class _AlbumPhotoPageState extends State<AlbumPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumCubit(),
      child: Scaffold(
        appBar: AppBarTitleProfile(
          context,
          0,
          title: widget.serviceData.name,
          functionBack: () {
            finish(context);
          },
        ),
        body: SizedBox(
          width: context.width(),
          height: context.height(),
          child: BlocBuilder<AlbumCubit, AlbumState>(
            builder: (context, state) {
              if (state is AlbumInitial) {
                BlocProvider.of<AlbumCubit>(context)
                    .fetchImage(widget.serviceData.serviceId);
              }
              if (state is AlbumLoad) {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  itemCount: state.images.length,
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio:
                          context.height() / context.width() - 0.8),
                  itemBuilder: (context, index) {
                    ImageData image = state.images[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ViewFileScreen(
                                    urlImage: getUrlImageOfService(widget
                                            .serviceData.serviceId
                                            .toString()) +
                                        "/${image.imageId}")));
                      },
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
                                widget.serviceData.serviceId.toString()) +
                            "/${image.imageId}",
                        fit: BoxFit.fill,
                        height: context.height() * 0.4,
                        width: context.width(),
                      ),
                    );
                  },
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressBar(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
