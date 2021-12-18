
import 'package:flutter/material.dart';

import '../UI/main/main_page.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MainPageSection());

      default:
        return null;
    }
  }
}
