import 'package:flutter/material.dart';
import 'package:flutter_base_project/view/settings/settings_screen.dart';

import '../view/home/home_screen.dart';

const String home = "/home";
const String settingsScreen= "/settings";
class AppRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  HomeScreen());
      case settingsScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  SettingsScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(home),
            ),
          ),
        );
    }
  }
}