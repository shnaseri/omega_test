import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../UI/main/main_page.dart';

class NavigationBarWidget extends StatelessWidget {
  final PersistentTabController controller;

  const NavigationBarWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PersistentTabView(
        context,
        controller: controller,

        confineInSafeArea: true,
        screens: _buildScreens(),
        items: _navBarsItems(),
        onItemSelected: (index){},
        stateManagement: true,
        resizeToAvoidBottomInset: false,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        decoration: const NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white60
          // colorBehindNavBar: Colors.white
        ),
        // padding: NavBarPadding.only(bottom: height*0.08),
        bottomScreenMargin: 0,

        navBarStyle: NavBarStyle.style6,
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        backgroundColor: Colors.white30,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
      ),
    );
  }

  _buildScreens() {
    return [
      Container(),
      Container(),
      MainPageSection(),
      Container(),
      // const CalenderPage2(),
      Container()
    ];
  }

  _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: 'اخبار',
        icon: const Icon(
          LineIcons.newspaper,
          // key: IntroRepository.introHomePage.keys[3] ,
        ),
        // title: ("Home"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.inactiveGray,
      ),
      PersistentBottomNavBarItem(
        title: 'متوفیان',

        icon: const Icon(
          LineIcons.skull,
          // key: IntroRepository.introHomePage.keys[4] ,
        ),
        // title: ("Settings"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.inactiveGray,
      ),
      PersistentBottomNavBarItem(

        title: 'خدمات',

        icon: const Icon(
          Icons.home_repair_service,
          // key: IntroRepository.introHomePage.keys[5] ,
        ),
        // title: ("Settings"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.inactiveGray,
      ),
      PersistentBottomNavBarItem(
        title: 'پیگیری',

        icon: const Icon(
          LineIcons.search,
        ),
        // title: ("Settings"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.inactiveGray,
      ),
      PersistentBottomNavBarItem(
        title: 'ارزش افزوده',

        icon: const Icon(
          LineIcons.helping_hands,
          // key: IntroRepository.introHomePage.keys[7] ,
        ),
        // title: ("Settings"),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.inactiveGray,
      ),
    ];
  }
}
