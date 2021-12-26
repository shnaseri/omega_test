import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:omega_test/model/service_data.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../logical/general_functions.dart';
import '../../state_management/main_page/main_cubit.dart';
import '../album/album_page.dart';
import '../detail/detail_page.dart';
import '../utils/appbars/appbar_home.dart';
import '../utils/components/circular_progressbar_component.dart';
import 'components/slider_image.dart';

class MainPageSection extends StatefulWidget {
  const MainPageSection({Key? key}) : super(key: key);

  @override
  _MainPageSectionState createState() => _MainPageSectionState();
}

class _MainPageSectionState extends State<MainPageSection> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBarHome(
            context,
            title: 'درخواست آنلاین خدمات بهشت زهرا (س)',
          ),
          floatingActionButton: Align(
            alignment: Alignment(-1, 0.85),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                  color: const Color(0xff3CB371),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(21)),
              child: Text(
                'رزرو مراسم',
                style: boldTextStyle(color: Colors.white),
              ),
            ),
          ),
          body: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              SliderImage(),
              Container(
                height: 60,
                decoration: BoxDecoration(color: Color(0xff5F6A6B)),
                child: Center(
                  child: Text(
                    'به چه خدماتی نیاز دارید؟',
                    style: boldTextStyle(color: Colors.white, size: 20),
                  ),
                ),
              ),
              BlocBuilder<MainCubit, MainState>(
                builder: (context, state) {
                  if(state is MainInitial)
                    {
                      BlocProvider.of<MainCubit>(context).fetchMainPage();
                    }
                  if(state is MainLoadedState) {
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.services.length,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio:
                              context.height() / context.width() - 0.95),
                      itemBuilder: (context, index) {
                        ServiceData service = state.services[index];
                        return GestureDetector(
                          onTap: () {

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              12.height,
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    pushNewScreen(
                                      context,
                                        screen: AlbumPhotoPage(
                                            serviceData: service,
                                          ),
                                      withNavBar: false,
                                      pageTransitionAnimation: PageTransitionAnimation.fade// OPTIONAL VALUE. True by default.
                                    );
                                  },
                                  child: Hero(
                                    tag: service.serviceId,
                                    child: CachedNetworkImage(
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill, image: imageProvider)),
                                        );
                                      },
                                      placeholder: (context, strImage) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2.0,
                                            ),
                                          ),
                                        );
                                      },
                                      imageUrl: getUrlImageOfService(service.serviceId.toString()),
                                      fit: BoxFit.contain,
                                      height: context.width() * 0.32,
                                      width: context.width() * 0.32,
                                    ),
                                  ),
                                ),
                                flex: 5,
                              ),
                              15.height,
                              Expanded(
                                  child: Container(
                                    child: Text(
                                      service.name,
                                      style: boldTextStyle(size: 18),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      pushNewScreen(context,
                                          screen: DetailScreen(
                                            serviceData: service,
                                          ),
                                          withNavBar: false,
                                          pageTransitionAnimation:
                                              PageTransitionAnimation
                                                  .fade // OPTIONAL VALUE. True by default.
                                          );
                                    },
                                    child: Container(
                                      height: context.height() * 0.037,
                                      width: context.width() * 0.15,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          // color: state is SendingSemanticState
                                          //     ? Colors.grey.withAlpha(120)
                                          //     : Color(0xff72add7)
                                          color: const Color(0xff91C773)),
                                      child: FittedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.sort,
                                                color: Colors.white,
                                              ),
                                              6.width,
                                              const Text(
                                                'جزئیات',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ).paddingAll(5)
                              ],
                          ),
                        ),
                      );
                    },
                  );
                  }
                  return const Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: CircularProgressBar(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
