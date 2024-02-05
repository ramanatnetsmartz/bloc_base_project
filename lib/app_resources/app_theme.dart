import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';

final appTheme = ThemeData(
  useMaterial3: false,
  primaryColor: colorPrimary,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: colorAccent,
    selectionColor: colorPrimary,
    selectionHandleColor: colorAccent,
  ),
  scaffoldBackgroundColor: colorWhite,
  appBarTheme: const AppBarTheme(
    backgroundColor: colorWhite,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: colorWhite,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),
  fontFamily: 'Arial',
  textTheme: TextTheme(
    bodySmall: const TextStyle(
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: dimen15,
      color: Colors.grey[600],
    ),
    bodyLarge: const TextStyle(
      fontWeight: FontWeight.w700,
    ),
  ),
);
