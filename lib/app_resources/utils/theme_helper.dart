import 'package:shared_preferences/shared_preferences.dart';

import '../app_constants.dart';

Future<bool> isDark() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(isDarkKey) ?? false;
}

Future<void> setTheme(bool isDark) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(isDarkKey, !isDark);
}