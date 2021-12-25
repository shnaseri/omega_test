
import 'package:flutter/material.dart';

import '../UI/main/main_page.dart';
import '../UI/navigarion_page.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const NavigationPage());

      default:
        return null;
    }
  }
}
